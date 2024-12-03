package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsSafetyPlanningMapper;
import com.neuedu.sports.domain.SportsSafetyPlanning;
import com.neuedu.sports.service.ISportsSafetyPlanningService;

/**
 * 安全与健康协议-安全规划Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsSafetyPlanningServiceImpl extends ServiceImpl<SportsSafetyPlanningMapper, SportsSafetyPlanning> implements ISportsSafetyPlanningService
{
    private final SportsSafetyPlanningMapper sportsSafetyPlanningMapper;

    /**
     * 查询安全与健康协议-安全规划
     * 
     * @param id 安全与健康协议-安全规划主键
     * @return 安全与健康协议-安全规划
     */
    @Override
    public SportsSafetyPlanning selectSportsSafetyPlanningById(Long id)
    {
        return sportsSafetyPlanningMapper.selectSportsSafetyPlanningById(id);
    }

    /**
     * 查询安全与健康协议-安全规划列表
     * 
     * @param sportsSafetyPlanning 安全与健康协议-安全规划
     * @return 安全与健康协议-安全规划
     */
    @Override
    public List<SportsSafetyPlanning> selectSportsSafetyPlanningList(SportsSafetyPlanning sportsSafetyPlanning)
    {
        return sportsSafetyPlanningMapper.selectSportsSafetyPlanningList(sportsSafetyPlanning);
    }

    /**
     * 新增安全与健康协议-安全规划
     * 
     * @param sportsSafetyPlanning 安全与健康协议-安全规划
     * @return 结果
     */
    @Override
    public int insertSportsSafetyPlanning(SportsSafetyPlanning sportsSafetyPlanning)
    {
        sportsSafetyPlanning.setCreateTime(DateUtils.getNowDate());
        return sportsSafetyPlanningMapper.insertSportsSafetyPlanning(sportsSafetyPlanning);
    }

    /**
     * 修改安全与健康协议-安全规划
     * 
     * @param sportsSafetyPlanning 安全与健康协议-安全规划
     * @return 结果
     */
    @Override
    public int updateSportsSafetyPlanning(SportsSafetyPlanning sportsSafetyPlanning)
    {
        sportsSafetyPlanning.setUpdateTime(DateUtils.getNowDate());
        return sportsSafetyPlanningMapper.updateSportsSafetyPlanning(sportsSafetyPlanning);
    }

    /**
     * 批量删除安全与健康协议-安全规划
     * 
     * @param ids 需要删除的安全与健康协议-安全规划主键
     * @return 结果
     */
    @Override
    public int deleteSportsSafetyPlanningByIds(Long[] ids)
    {
        return sportsSafetyPlanningMapper.deleteSportsSafetyPlanningByIds(ids);
    }

    /**
     * 删除安全与健康协议-安全规划信息
     * 
     * @param id 安全与健康协议-安全规划主键
     * @return 结果
     */
    @Override
    public int deleteSportsSafetyPlanningById(Long id)
    {
        return sportsSafetyPlanningMapper.deleteSportsSafetyPlanningById(id);
    }
}
