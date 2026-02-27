import { chromium } from 'playwright';


(async () => {
  try {
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();
    await page.goto('https://example.com', { timeout: 10000 });
    console.log(await page.title());
    await browser.close();
  } catch (err) { console.log('Playwright Error', err) }
})();