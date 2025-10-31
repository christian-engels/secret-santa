# 🎅 Secret Santa Email Automator 🎄

Ho ho ho! Tired of drawing names from a hat? Let R do the hard work while you sip your hot cocoa!

This magical script automatically assigns Secret Santa pairs and emails everyone their assignment. No peeking, no cheating, just pure algorithmic gift-giving joy!

## 🎁 What Does It Do?

The [secret-santa.R](secret-santa.R) script:
- Randomly assigns Secret Santa pairs (without anyone getting themselves)
- Sends personalized emails to everyone with their assignment
- Keeps the magic alive by automating the whole process!

## 🛷 Getting Started

### Prerequisites

You'll need R installed on your system. We recommend using **rig** (the R Installation Manager) for a smooth setup:

```bash
# Install rig from https://github.com/r-lib/rig
```

### Installation

1. Clone this festive repo:
```bash
git clone https://github.com/christian-engels/secret-santa.git
cd secret-santa
```

2. Install packages using **renv** (because dependency management is a gift that keeps on giving):
```r
# Open R in the project directory
renv::restore()
```

### Setup Your Participant List

Create a CSV file named `email-addresses.csv` in the project root with the following columns:

```csv
first_name,last_name,email
Buddy,Elf,buddy@northpole.com
Santa,Claus,santa@northpole.com
Mrs,Claus,mrs.claus@northpole.com
```

**Required columns:**
- `first_name` - The participant's first name
- `last_name` - The participant's last name
- `email` - Their email address (for receiving assignments)

### Run the Script

```r
source("secret-santa.R")
```

And watch the holiday magic happen! ✨

## 🎄 Notes

- Make sure you have email credentials configured
- Customize the email template in [email-template.md](email-template.md)
- The script ensures no one gets assigned to themselves (that would be awkward!)

## 🎉 Happy Holidays!

May your Secret Santa exchange be merry, bright, and entirely automated!

---

*Built with R, love, and a sprinkle of holiday cheer* ❄️
