import { defineConfig } from '@playwright/test';

export default defineConfig({
  reporter: [
    ['list'],
    ['html', { outputFolder: 'test-results/html' }],
    ['junit', { outputFile: 'test-results/results.xml' }],
  ],
});
