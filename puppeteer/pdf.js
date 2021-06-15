const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    await page.goto('http://frontend:8082');
    //await page.waitForSelector('#loaded');
    await page.pdf({
        displayHeaderFooter: true,
        // HTML in the header and footer
        // templates is unstyled by default.
        // You have to use inline styles for
        // styling.
        footerTemplate: `
      <style>
      div {
        width: 100%;
        padding-right: 1.5cm;
        padding-bottom: 0.25cm;
        font-family: Arial;
        font-size: 8pt;
        text-align: right;
        color: #666;
      }
      </style>
      <div>
        Page <span class="pageNumber"></span> / <span class="totalPages"></span>
      </div>
    `,
        headerTemplate: ' ',
        format: 'A4',
        path: `/puppeteer/file.pdf`,
        printBackground: true,
    });
    await browser.close();
})();