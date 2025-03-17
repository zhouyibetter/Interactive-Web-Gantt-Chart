import request from '@/util/request'

export function login(username, password) {
    console.log(username);
    console.log(password);
    
    return request.post('/user/login', {username, password});
}