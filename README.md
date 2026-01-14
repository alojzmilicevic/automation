# n8n Birthday/Nameday Reminder System

Automated system to send birthday, nameday, and slava reminders via SMS or Messenger.

## Setup

### 1. Environment Configuration

Copy the template file and add your secrets:

```bash
cp env.template .env
```

Then edit `.env` with your actual credentials:
- n8n owner email and password
- Generate a random encryption key

### 2. Start n8n

```bash
docker-compose up -d
```

Access n8n at: http://localhost:5678

### 3. Import Workflows

Import the workflow JSON files:
- `occasions.json` - Main workflow
- `todays_events (sub).json` - Subworkflow for processing events

### 4. Configure Credentials in n8n

- Google Sheets API credentials
- Twilio credentials (if using)
- Any other service credentials

### 5. Testing with iOS Shortcuts

For development, use ngrok to expose your local n8n:

```bash
ngrok http 5678
```

Use the ngrok URL in your iOS Shortcut.

## Security Notes

⚠️ **NEVER commit `.env` file to git**

The `.env` file contains sensitive credentials and is excluded via `.gitignore`.

If you accidentally commit secrets, you should:
1. Rotate all credentials immediately
2. Use `git filter-branch` or BFG Repo-Cleaner to remove from history
3. Force push to remote (if already pushed)

## Syncing Between Computers

Workflows are stored in Docker volumes. To sync between computers:
- Export workflows as JSON from n8n UI
- Commit workflow JSON files to git
- Import on other computer

Credentials are NOT synced (security feature) - set them up on each machine.
