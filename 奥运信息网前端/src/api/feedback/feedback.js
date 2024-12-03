import request from '@/utils/request'

export function listFeedback(params){
    return request({
        url: '/api/feedback/list',
        method: 'GET',
        params
    })
}

export function getFeedback(id){
    return request({
        url: '/api/feedback/' + id,
        method: 'GET'
    })
}

export function addFeedback(data){
    return request({
        url: '/api/feedback',
        method: 'POST',
        data
    })
}