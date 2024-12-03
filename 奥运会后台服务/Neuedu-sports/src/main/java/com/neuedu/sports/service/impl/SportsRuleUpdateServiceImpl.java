package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsRuleUpdateMapper;
import com.neuedu.sports.domain.SportsRuleUpdate;
import com.neuedu.sports.service.ISportsRuleUpdateService;

/**
 * 赛事管理-规则更新Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsRuleUpdateServiceImpl extends ServiceImpl<SportsRuleUpdateMapper, SportsRuleUpdate> implements ISportsRuleUpdateService
{
    private final SportsRuleUpdateMapper sportsRuleUpdateMapper;

    /**
     * 查询赛事管理-规则更新
     * 
     * @param id 赛事管理-规则更新主键
     * @return 赛事管理-规则更新
     */
    @Override
    public SportsRuleUpdate selectSportsRuleUpdateById(Long id)
    {
        return sportsRuleUpdateMapper.selectSportsRuleUpdateById(id);
    }

    /**
     * 查询赛事管理-规则更新列表
     * 
     * @param sportsRuleUpdate 赛事管理-规则更新
     * @return 赛事管理-规则更新
     */
    @Override
    public List<SportsRuleUpdate> selectSportsRuleUpdateList(SportsRuleUpdate sportsRuleUpdate)
    {
        return sportsRuleUpdateMapper.selectSportsRuleUpdateList(sportsRuleUpdate);
    }

    /**
     * 新增赛事管理-规则更新
     * 
     * @param sportsRuleUpdate 赛事管理-规则更新
     * @return 结果
     */
    @Override
    public int insertSportsRuleUpdate(SportsRuleUpdate sportsRuleUpdate)
    {
        sportsRuleUpdate.setCreateTime(DateUtils.getNowDate());
        return sportsRuleUpdateMapper.insertSportsRuleUpdate(sportsRuleUpdate);
    }

    /**
     * 修改赛事管理-规则更新
     * 
     * @param sportsRuleUpdate 赛事管理-规则更新
     * @return 结果
     */
    @Override
    public int updateSportsRuleUpdate(SportsRuleUpdate sportsRuleUpdate)
    {
        sportsRuleUpdate.setUpdateTime(DateUtils.getNowDate());
        return sportsRuleUpdateMapper.updateSportsRuleUpdate(sportsRuleUpdate);
    }

    /**
     * 批量删除赛事管理-规则更新
     * 
     * @param ids 需要删除的赛事管理-规则更新主键
     * @return 结果
     */
    @Override
    public int deleteSportsRuleUpdateByIds(Long[] ids)
    {
        return sportsRuleUpdateMapper.deleteSportsRuleUpdateByIds(ids);
    }

    /**
     * 删除赛事管理-规则更新信息
     * 
     * @param id 赛事管理-规则更新主键
     * @return 结果
     */
    @Override
    public int deleteSportsRuleUpdateById(Long id)
    {
        return sportsRuleUpdateMapper.deleteSportsRuleUpdateById(id);
    }
}
