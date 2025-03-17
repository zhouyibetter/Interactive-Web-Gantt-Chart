import { createRouter, createWebHistory } from 'vue-router';
import LoginWork from '@/views/LoginWork.vue';
import Gantt from '@/views/Gantt.vue';
import Dashboard from '@/views/Dashboard.vue';
import request from '@/util/request';

const routes = [
    {
        path: '/user/login',
        component: LoginWork
    },
    {
        path: '/gantt',
        component: Gantt,
        meta: { requireAuth: true }
    },
    {
        path: '/dashboard',
        component: Dashboard
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
});

const IsAuthenticated = async function () {
    let data = await request.post('http://localhost:8081/user/auth');

    return data.code == 0;
}

// 添加全局导航守卫
router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requireAuth)) {
        if (!IsAuthenticated()) {
            next({ path: '/user/login' });
        } else {
            next();
        }
    } else {
        next();
    }
});

export default router;