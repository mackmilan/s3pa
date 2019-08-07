Vue.component('ui-button', {
   props: ['action', 'caption', 'id', 'submit'],
   template: `
      <button :id="id" type="button" v-on:click="onClick($event)" class="uk-button uk-button-primary">
         {{ caption }}
      </button>
   `,
   methods: {
      onClick: function (ev) {
         if (this.submit) {
            if (this.$parent.action) {
               var data = {
                  uuid: uuid,
                  context: context,
                  source: this.id,
                  data: this.$parent.datamodel || {}
               }

               console.log(data);

               axios({
                  method: 'post',
                  url: this.$parent.action,
                  responseType: 'json',
                  data: this.$parent.datamodel
               }).then(function (response) {
                  console.log(response);
               });
            } else {
               UIkit.notification({
                  message: '<span uk-icon="icon: warning"></span> Ação não definida',
                  status: 'warning'
               })
            }
         }
      }
   }
});