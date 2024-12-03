package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsAccommodationScheduling;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 住宿与交通调度-住宿调度Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsAccommodationSchedulingService extends IService<SportsAccommodationScheduling>
{
    /**
     * 查询住宿与交通调度-住宿调度
     * 
     * @param id 住宿与交通调度-住宿调度主键
     * @return 住宿与交通调度-住宿调度
     */
    public SportsAccommodationScheduling selectSportsAccommodationSchedulingById(Long id);

    /**
     * 查询住宿与交通调度-住宿调度列表
     * 
     * @param sportsAccommodationScheduling 住宿与交通调度-住宿调度
     * @return 住宿与交通调度-住宿调度集合
     */
    public List<SportsAccommodationScheduling> selectSportsAccommodationSchedulingList(SportsAccommodationScheduling sportsAccommodationScheduling);

    /**
     * 新增住宿与交通调度-住宿调度
     * 
     * @param sportsAccommodationScheduling 住宿与交通调度-住宿调度
     * @return 结果
     */
    public int insertSportsAccommodationScheduling(SportsAccommodationScheduling sportsAccommodationScheduling);

    /**
     * 修改住宿与交通调度-住宿调度
     * 
     * @param sportsAccommodationScheduling 住宿与交通调度-住宿调度
     * @return 结果
     */
    public int updateSportsAccommodationScheduling(SportsAccommodationScheduling sportsAccommodationScheduling);

    /**
     * 批量删除住宿与交通调度-住宿调度
     * 
     * @param ids 需要删除的住宿与交通调度-住宿调度主键集合
     * @return 结果
     */
    public int deleteSportsAccommodationSchedulingByIds(Long[] ids);

    /**
     * 删除住宿与交通调度-住宿调度信息
     * 
     * @param id 住宿与交通调度-住宿调度主键
     * @return 结果
     */
    public int deleteSportsAccommodationSchedulingById(Long id);
}
