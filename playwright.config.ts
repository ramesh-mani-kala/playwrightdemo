import { defineConfig } from '@playwright/test';

export default defineConfig({
  reporter: [
    ['list'],
    ['html', { outputFolder: 'playwright-html-report' }],
    ['junit', { outputFile: 'playwright-html-report/results.xml' }],
  ],
});
