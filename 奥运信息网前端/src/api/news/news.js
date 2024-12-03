import request from '@/utils/request'

export function getNewsList(params){
    return request({
        url: '/api/news/list',
        method: 'GET',
        params
    })
}

export function getNewsDetail(id){
    return request({
        url: '/api/news/' + id,
        method: 'GET'
    })
}

export function viewNews(data){
    return request({
        url: '/api/news/view',
        method: 'PUT',
        data
    })
}