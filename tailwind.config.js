/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [ './**/*.{html,php}',
    './components/**/*.{html,php}',],
  theme: {
    extend: {
      screens: {
        '3xl': '1920px',
        '4xl': '2560px',
        '5xl': '3840px'
      },
      colors: {
        'DrimGray' : '#736f6f',
        'CadetGray' : '#9e9e9e',
        'EerieBlack' : '#212529',
        'Jet' : '#303030',
        'Silver' : '#A9A49D',
        'Platinum' : '#EAE8E3',
      },
      fontFamily: {
      'Overlock' : ['Overlock'],
      'KiteOne' : ['Kite One'],
      'Philosopher' : ['Philosopher'],
      'Gotu' : ['"Gotu"'],
      },
      cursor: {
        'BoPointing': 'url(/pictures/interface/pointing-bo-hand-white.cur), pointer',
        'BoClickAndDrag': 'url(/pictures/interface/Bo_Click_and_Drag_Cursor.cur), grab',
        'BoClosedFistDrag': 'url(/pictures/interface/Bo_Closed_Fist_Drag_Cursor.cur), grabbing',
        'BoClosedFistDrag2': 'url(/pictures/interface/Bo_Closed_Fist_Drag_Cursor_2.cur), grabbing',
        'BoDefault': 'url(/pictures/interface/Bo_Cursor_Pointer_32.cur), default',
      }
    },
  },
  plugins: [
    require('tailwind-scrollbar')({ preferredStrategy: 'pseudoelements' }),
  ],
}

