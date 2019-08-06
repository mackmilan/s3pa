Vue.component('ui-button', {
   props: ['caption', 'id'],
   template: `
      <button :id="id" type="button" v-on:click="onClick" class="uk-button uk-button-primary">{{ caption }}</button>
   `,
   methods: {
      onClick: function (ev) {
         axios({
            method: 'post',
            url: '/s3pa/poll/',
            responseType: 'json',
            data: {
               uuid: uuid,
               context: context,
               source: this.id,
               target: 'onClick'
            }
         }).then(function (response) {
            console.log(response);
         });
      }
   }
});