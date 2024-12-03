package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsVolunteerTrainingManagement;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 志愿者管理-培训管理Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsVolunteerTrainingManagementMapper extends BaseMapper<SportsVolunteerTrainingManagement>
{
    /**
     * 查询志愿者管理-培训管理
     * 
     * @param id 志愿者管理-培训管理主键
     * @return 志愿者管理-培训管理
     */
    public SportsVolunteerTrainingManagement selectSportsVolunteerTrainingManagementById(Long id);

    /**
     * 查询志愿者管理-培训管理列表
     * 
     * @param sportsVolunteerTrainingManagement 志愿者管理-培训管理
     * @return 志愿者管理-培训管理集合
     */
    public List<SportsVolunteerTrainingManagement> selectSportsVolunteerTrainingManagementList(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement);

    /**
     * 新增志愿者管理-培训管理
     * 
     * @param sportsVolunteerTrainingManagement 志愿者管理-培训管理
     * @return 结果
     */
    public int insertSportsVolunteerTrainingManagement(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement);

    /**
     * 修改志愿者管理-培训管理
     * 
     * @param sportsVolunteerTrainingManagement 志愿者管理-培训管理
     * @return 结果
     */
    public int updateSportsVolunteerTrainingManagement(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement);

    /**
     * 删除志愿者管理-培训管理
     * 
     * @param id 志愿者管理-培训管理主键
     * @return 结果
     */
    public int deleteSportsVolunteerTrainingManagementById(Long id);

    /**
     * 批量删除志愿者管理-培训管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsVolunteerTrainingManagementByIds(Long[] ids);
}
