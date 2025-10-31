library(tidyverse)
library(Microsoft365R)
library(blastula)

# Authenticate
outlook <- get_business_outlook()

# Sending emails function
send_email <- function(subject, body, email_from) {
  body <- compose_email(
    body=md(body)
)
  email <- outlook$create_email()
  email$set_subject(subject)
  email$set_body(body, content_type = "html")
  email$add_recipients(to = email_from)
  email$send()
  return(TRUE)
}

# Read people data (expects columns first_name, last_name, email)
people <- read_csv("email-addresses.csv") 

# Create Secret Santa assignments (from -> to)
from_to <- tibble(
  email_from = people |> sample_n(n()) |> pull(email),
  email_to = lead(email_from, default = first(email_from))
)

# Add names to the assignments for personalized emails
from_to_emails <- from_to |>
  left_join(people, by = c("email_from" = "email")) |> 
  left_join(people, by = c("email_to" = "email"), suffix = c("_from", "_to")) |> 
  select(-email_to) |> 
  mutate(email = read_file("email-template.md") |> str_glue()) 

# Sent emails
from_to_sent <- from_to_emails |> 
    rowwise() |> 
    mutate(sent = send_email("Bug in the Christmas Pudding: Your REAL Secret Santa Assignment!", email, email_from))

# Delete all Secret Santa emails from Sent folder
sent_folder <- outlook$get_folder("Sent Items")
emails_to_delete <- sent_folder$list_emails(
  filter = "contains(subject, 'Bug in the Christmas Pudding: Your REAL Secret Santa Assignment!')"
)

message("Found ", length(emails_to_delete), " emails to delete")
if (length(emails_to_delete) > 0) {
  for (email in emails_to_delete) {
    email$delete()
    message("Deleted email")
  }
} else {
  message("No emails found to delete")
}

