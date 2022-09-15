# Omniauth::AmazonSP

---

Login with Amazon SP OAuth 2 strategy for Omniauth.

---

## Installation

Add the following line to you Gemfile:

```bash
gem 'omniauth-amazon-sp'
```

Then run

```bash
bundle install
```

---

## Requirements

You must have an Amazon Selling Partner Account. As well as a Selling Partner Application.

---

## Configuration

You must have the following Rails credentials set:

```bash
amazon_sp_api:
  app_id: [YOUR_APP_ID] 
  client_id: [YOUR_CLIENT_ID] 
  client_secret: [YOUR_CLIENT_SECRET] 
  version: beta (only if your app is in draft state)
```

Then you can set up the strategy via the following: (devise)

```ruby
config.omniauth :amazon-sp,
  Rails.application.credentials.dig(:amazon_sp_api, :client_id),
  Rails.application.credentials.dig(:amazon_sp_api, :client_secret),
  name: :amazon
  scope: %w(profile:user_id)
```
