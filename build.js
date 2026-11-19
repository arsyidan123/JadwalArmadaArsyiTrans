// Build statis: menyalin index.html ke dist/ dan mengisi konfigurasi Supabase dari environment variable.
const fs = require('fs');
const url = process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL || '';
const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY || '';
if (!url || !key) console.warn('PERINGATAN: env Supabase kosong, aplikasi berjalan dalam mode lokal.');
let html = fs.readFileSync('index.html', 'utf8');
if (url && key) html = html.replace('__SUPABASE_URL__', url).replace('__SUPABASE_ANON_KEY__', key);
fs.mkdirSync('dist', { recursive: true });
fs.writeFileSync('dist/index.html', html);
console.log('Build selesai: dist/index.html');
