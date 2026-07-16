import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';

// https://astro.build/config
// This is a user/organization site (amitkumargoyal.github.io), so base = '/'.
// If you ever move it to a project repo, change base to '/repo-name/'.
export default defineConfig({
  site: 'https://amitkumargoyal.com',
  base: '/',
  integrations: [
    mdx({
      remarkPlugins: [remarkMath],
      rehypePlugins: [rehypeKatex],
    }),
  ],
  markdown: {
    remarkPlugins: [remarkMath],
    rehypePlugins: [rehypeKatex],
  },
});