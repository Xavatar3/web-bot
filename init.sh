#!/bin/bash
# Install Playwright Chromium dependencies and log output

mkdir -p logs

echo "Updating package lists..." | tee logs/apt_update.log
sudo apt update | tee -a logs/apt_update.log

echo "Installing dependencies..." | tee logs/apt_install.log
sudo apt install -y \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libcups2 \
  libdrm2 \
  libgbm1 \
  libgtk-3-0 \
  libnspr4 \
  libnss3 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  libxshmfence1 \
  libx11-xcb1 \
  libxkbcommon0 \
  libpango-1.0-0 \
  libasound2 \
  libwayland-client0 \
  libwayland-cursor0 \
  libx11-6 \
  fonts-liberation \
  libwoff1 \
  libharfbuzz0b | tee -a logs/apt_install.log

echo "Running Playwright script..." | tee -a logs/playwright.log
node src/script.js 2>&1 | tee -a logs/playwright.log

echo "Committing logs..." | tee -a logs/git.log
git add logs/apt_update.log logs/apt_install.log logs/playwright.log
git commit -m "Add Playwright Chromium dependencies installation logs" | tee -a logs/git.log
git push origin main | tee -a logs/git.log

echo "Done. All logs committed and pushed."