Vue.component('ui-image', {
   template: `
      <div class="uk-margin">
         <img :data-src="'/images/' + src" :width="width" :height="height" :alt="alt" uk-img/>
      </div>
   `,
   props: ['src', 'width', 'height', 'alt']
});