import { createApp } from 'vue'
import App from './App.vue'
import FontAwesomeIcon from './plugins/font-awesome';
import router from './router';
import store from './store';
import 'bootstrap/dist/css/bootstrap.min.css';
import '@/assets/css/nucleo-icons.css';
import '@/assets/css/nucleo-svg.css';
import '@/assets/scss/soft-ui-dashboard.scss';

const app = createApp(App)
app.use(router)
app.use(store)
app.component('font-awesome-icon', FontAwesomeIcon);
app.mount('#app')
