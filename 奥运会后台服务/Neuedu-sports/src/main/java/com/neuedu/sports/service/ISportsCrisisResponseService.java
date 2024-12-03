package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsCrisisResponse;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 安全与健康协议-危机响应Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsCrisisResponseService extends IService<SportsCrisisResponse>
{
    /**
     * 查询安全与健康协议-危机响应
     * 
     * @param id 安全与健康协议-危机响应主键
     * @return 安全与健康协议-危机响应
     */
    public SportsCrisisResponse selectSportsCrisisResponseById(Long id);

    /**
     * 查询安全与健康协议-危机响应列表
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 安全与健康协议-危机响应集合
     */
    public List<SportsCrisisResponse> selectSportsCrisisResponseList(SportsCrisisResponse sportsCrisisResponse);

    /**
     * 新增安全与健康协议-危机响应
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 结果
     */
    public int insertSportsCrisisResponse(SportsCrisisResponse sportsCrisisResponse);

    /**
     * 修改安全与健康协议-危机响应
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 结果
     */
    public int updateSportsCrisisResponse(SportsCrisisResponse sportsCrisisResponse);

    /**
     * 批量删除安全与健康协议-危机响应
     * 
     * @param ids 需要删除的安全与健康协议-危机响应主键集合
     * @return 结果
     */
    public int deleteSportsCrisisResponseByIds(Long[] ids);

    /**
     * 删除安全与健康协议-危机响应信息
     * 
     * @param id 安全与健康协议-危机响应主键
     * @return 结果
     */
    public int deleteSportsCrisisResponseById(Long id);
}
