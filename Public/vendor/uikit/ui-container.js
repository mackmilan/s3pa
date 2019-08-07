Vue.component('ui-container', {
   template: `
      <div :class="'uk-margin uk-container uk-container-' + size">
         <slot></slot>
      </div>
   `,
   props: ['size']
});