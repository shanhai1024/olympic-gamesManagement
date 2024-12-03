package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsAccommodationScheduling;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 住宿与交通调度-住宿调度Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsAccommodationSchedulingMapper extends BaseMapper<SportsAccommodationScheduling>
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
     * 删除住宿与交通调度-住宿调度
     * 
     * @param id 住宿与交通调度-住宿调度主键
     * @return 结果
     */
    public int deleteSportsAccommodationSchedulingById(Long id);

    /**
     * 批量删除住宿与交通调度-住宿调度
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAccommodationSchedulingByIds(Long[] ids);
}
