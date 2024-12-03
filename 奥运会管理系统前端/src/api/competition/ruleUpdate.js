import request from '@/utils/request'

// 查询赛事管理-规则更新列表
export function listRuleUpdate(query) {
  return request({
    url: '/competition/ruleUpdate/list',
    method: 'get',
    params: query
  })
}

// 查询赛事管理-规则更新详细
export function getRuleUpdate(id) {
  return request({
    url: '/competition/ruleUpdate/' + id,
    method: 'get'
  })
}

// 新增赛事管理-规则更新
export function addRuleUpdate(data) {
  return request({
    url: '/competition/ruleUpdate',
    method: 'post',
    data: data
  })
}

// 修改赛事管理-规则更新
export function updateRuleUpdate(data) {
  return request({
    url: '/competition/ruleUpdate',
    method: 'put',
    data: data
  })
}

// 删除赛事管理-规则更新
export function delRuleUpdate(id) {
  return request({
    url: '/competition/ruleUpdate/' + id,
    method: 'delete'
  })
}
