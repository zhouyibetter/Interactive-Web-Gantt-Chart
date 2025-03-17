// 导入axios
import axios from 'axios';

const baseURL = 'http://localhost:8081';
const instance = axios.create({
    baseURL,
    headers: {
        'Content-Type': 'application/json'
    }
});

// 添加请求拦截器
instance.interceptors.request.use(
    config => {
        const token = localStorage.getItem('token');
        if (token) {
            config.headers['Authorization'] = token;
        }
        return config;
    }, err => {
        return Promise.reject(err);
    }
)

// 添加响应拦截器
instance.interceptors.response.use(
    result => {
        return result.data;
    }, err => {
        alert('服务异常');
        return Promise.reject(err); // 异步的状态转化成失败的状态
    }
)

export default instance;