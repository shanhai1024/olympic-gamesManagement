package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsRuleUpdate;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 赛事管理-规则更新Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsRuleUpdateService extends IService<SportsRuleUpdate>
{
    /**
     * 查询赛事管理-规则更新
     * 
     * @param id 赛事管理-规则更新主键
     * @return 赛事管理-规则更新
     */
    public SportsRuleUpdate selectSportsRuleUpdateById(Long id);

    /**
     * 查询赛事管理-规则更新列表
     * 
     * @param sportsRuleUpdate 赛事管理-规则更新
     * @return 赛事管理-规则更新集合
     */
    public List<SportsRuleUpdate> selectSportsRuleUpdateList(SportsRuleUpdate sportsRuleUpdate);

    /**
     * 新增赛事管理-规则更新
     * 
     * @param sportsRuleUpdate 赛事管理-规则更新
     * @return 结果
     */
    public int insertSportsRuleUpdate(SportsRuleUpdate sportsRuleUpdate);

    /**
     * 修改赛事管理-规则更新
     * 
     * @param sportsRuleUpdate 赛事管理-规则更新
     * @return 结果
     */
    public int updateSportsRuleUpdate(SportsRuleUpdate sportsRuleUpdate);

    /**
     * 批量删除赛事管理-规则更新
     * 
     * @param ids 需要删除的赛事管理-规则更新主键集合
     * @return 结果
     */
    public int deleteSportsRuleUpdateByIds(Long[] ids);

    /**
     * 删除赛事管理-规则更新信息
     * 
     * @param id 赛事管理-规则更新主键
     * @return 结果
     */
    public int deleteSportsRuleUpdateById(Long id);
}
