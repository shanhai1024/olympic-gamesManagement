package com.neuedu.zyzxx.mapper;

import java.util.List;
import com.neuedu.zyzxx.domain.SportsVolunteer1;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 志愿者信息中心Mapper接口
 *
 * @author ruoyi
 * @date 2024-11-12
 */
@Mapper
public interface SportsVolunteerMapper1 extends BaseMapper<SportsVolunteer1>
{
    /**
     * 查询志愿者信息中心
     *
     * @param id 志愿者信息中心主键
     * @return 志愿者信息中心
     */
    public SportsVolunteer1 selectSportsVolunteerById(Long id);

    /**
     * 查询志愿者信息中心列表
     *
     * @param sportsVolunteer 志愿者信息中心
     * @return 志愿者信息中心集合
     */
    public List<SportsVolunteer1> selectSportsVolunteerList(SportsVolunteer1 sportsVolunteer);

    /**
     * 新增志愿者信息中心
     *
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    public int insertSportsVolunteer(SportsVolunteer1 sportsVolunteer);

    /**
     * 修改志愿者信息中心
     *
     * @param sportsVolunteer 志愿者信息中心
     * @return 结果
     */
    public int updateSportsVolunteer(SportsVolunteer1 sportsVolunteer);

    /**
     * 删除志愿者信息中心
     *
     * @param id 志愿者信息中心主键
     * @return 结果
     */
    public int deleteSportsVolunteerById(Long id);

    /**
     * 批量删除志愿者信息中心
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsVolunteerByIds(Long[] ids);
}
