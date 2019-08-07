Vue.component('ui-form', {
   template: `
      <form :id="id">
         <fieldset class="uk-fieldset">
            <slot></slot>
         </fieldset>
      </form>
   `,
   props: ['action', 'id', 'datamodel']
});

Vue.component('ui-form-legend', {
   template: `
      <legend :class="'uk-legend uk-text-' + type">{{ caption }}</legend>
   `,
   props: ['caption', 'type']
});

Vue.component('ui-radiogroup', {
   template: `
      <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
         <slot></slot>
      </div>
   `,
   props: ['name'],
   methods: {
      datamodel: function () {
         return this.$parent.datamodel
      }
   }
});

Vue.component('ui-radio', {
   template: `
      <label>
         <input class="uk-radio" type="radio" :name="$parent.name" v-model="$parent.datamodel()[$parent.name]" :value="label"/> 
         &nbsp;{{ label }}
      </label>
   `,
   props: ['label']
});

Vue.component('ui-selectfield', {
   template: `
      <div class="uk-margin">
         <select class="uk-select" :name="name" :placeholder="placeholder">
            <option>{{ placeholder }}</option>
            <slot></slot>
         </select>
      </div>
   `,
   props: ['name', 'placeholder']
});

Vue.component('ui-select-option', {
   template: `
      <option :value="value">{{ caption }}</option>
   `,
   props: ['caption', 'value']
});

Vue.component('ui-textarea', {
   template: `
      <div class="uk-margin">
         <textarea :name="name" :placeholder="placeholder" class="uk-textarea" v-model="$parent.datamodel[name]"></textarea>
      </div>
   `,
   props: ['name', 'placeholder', 'value']
});

Vue.component('ui-textfield', {
   template: `
      <div class="uk-margin">
         <label class="uk-form-label" :for="name">{{ placeholder }}:</label>
         <div class="uk-form-controls">
            <div class="uk-inline uk-width-1-1">
               <span v-if="type" class="uk-form-icon" :uk-icon="'icon: ' + type"></span>
               <input type="text" class="uk-input" :placeholder="placeholder" :id="name" :name="name" v-model="$parent.datamodel[name]"/>
            </div>
         </div>
      </div>
   `,
   props: ['name', 'placeholder', 'type', 'value']
});

Vue.component('ui-passwordfield', {
   template: `
      <div class="uk-margin">
         <label class="uk-form-label" :for="name">{{ placeholder }}:</label>
         <div class="uk-form-controls">
            <div class="uk-inline uk-width-1-1">
               <span class="uk-form-icon" uk-icon="icon: lock"></span>
               <input type="password" class="uk-input" :placeholder="placeholder" :id="name" :name="name" v-model="$parent.datamodel[name]"/>
            </div>
         </div>
      </div>
   `,
   props: ['name', 'placeholder', 'value']
});