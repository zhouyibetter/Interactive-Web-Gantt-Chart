import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { faUser, faLock } from '@fortawesome/free-solid-svg-icons';
import { faQq, faWeixin, faWeibo, faAlipay } from '@fortawesome/free-brands-svg-icons';

library.add(faUser, faLock, faQq, faWeixin, faWeibo, faAlipay);

export default FontAwesomeIcon;