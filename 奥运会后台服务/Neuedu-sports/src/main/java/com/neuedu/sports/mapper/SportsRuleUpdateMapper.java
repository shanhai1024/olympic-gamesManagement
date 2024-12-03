package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsRuleUpdate;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 赛事管理-规则更新Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsRuleUpdateMapper extends BaseMapper<SportsRuleUpdate>
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
     * 删除赛事管理-规则更新
     * 
     * @param id 赛事管理-规则更新主键
     * @return 结果
     */
    public int deleteSportsRuleUpdateById(Long id);

    /**
     * 批量删除赛事管理-规则更新
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsRuleUpdateByIds(Long[] ids);
}
