Vue.component('ui-navbar', {
   template: `
      <nav :id="id" class="uk-navbar-container" uk-navbar>
          <div class="uk-navbar-left">
              <ul class="uk-navbar-nav">
                  <slot></slot>
              </ul>
          </div>
      </nav>
   `,
   props: ['id']
});

Vue.component('ui-navbar-dropdown', {
   template: `
      <li>
         <a>{{ caption }}</a>
         <div class="uk-navbar-dropdown">
            <ul class="uk-nav uk-navbar-dropdown-nav">
               <slot></slot>
            </ul>
         </div>
      </li>
   `,
   props: ['caption']
});

Vue.component('ui-nav-item', {
   template: `<li><a v-on:click.prevent="itemAction($event, action)">{{ caption }}</a></li>`,
   props: ['caption', 'action'],
   methods: {
      itemAction: function (ev, action) {
         console.log(ev, action);
      }
   }
});