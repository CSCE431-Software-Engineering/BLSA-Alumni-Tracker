const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Open Sans', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'tamu-maroon': '#500000',
        'tamu-white': '#ffffff',
        'tamu-dark-maroon': '#3c0000',
        'tamu-blue': '#003C71',
        'tamu-light-gray': '#a7a7a7',
        'tamu-dark-gray': '#333333',
        'tamu-black': '#000000',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
