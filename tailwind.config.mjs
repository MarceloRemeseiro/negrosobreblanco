/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			colors: {
				'blanco': '#FF00FF',
				'negro': '#212121',
				'gris': '#CCCCCC ',
				'grisOscuro':'#333333',
				'primario': '#A3C1AD',
				'secundario': '#E8AFAF'
			},
		},
	},
	plugins: [],
}
