package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsSafetyPlanning;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 安全与健康协议-安全规划Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsSafetyPlanningMapper extends BaseMapper<SportsSafetyPlanning>
{
    /**
     * 查询安全与健康协议-安全规划
     * 
     * @param id 安全与健康协议-安全规划主键
     * @return 安全与健康协议-安全规划
     */
    public SportsSafetyPlanning selectSportsSafetyPlanningById(Long id);

    /**
     * 查询安全与健康协议-安全规划列表
     * 
     * @param sportsSafetyPlanning 安全与健康协议-安全规划
     * @return 安全与健康协议-安全规划集合
     */
    public List<SportsSafetyPlanning> selectSportsSafetyPlanningList(SportsSafetyPlanning sportsSafetyPlanning);

    /**
     * 新增安全与健康协议-安全规划
     * 
     * @param sportsSafetyPlanning 安全与健康协议-安全规划
     * @return 结果
     */
    public int insertSportsSafetyPlanning(SportsSafetyPlanning sportsSafetyPlanning);

    /**
     * 修改安全与健康协议-安全规划
     * 
     * @param sportsSafetyPlanning 安全与健康协议-安全规划
     * @return 结果
     */
    public int updateSportsSafetyPlanning(SportsSafetyPlanning sportsSafetyPlanning);

    /**
     * 删除安全与健康协议-安全规划
     * 
     * @param id 安全与健康协议-安全规划主键
     * @return 结果
     */
    public int deleteSportsSafetyPlanningById(Long id);

    /**
     * 批量删除安全与健康协议-安全规划
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsSafetyPlanningByIds(Long[] ids);
}
