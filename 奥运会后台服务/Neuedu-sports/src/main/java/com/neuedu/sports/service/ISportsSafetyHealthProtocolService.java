package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsSafetyHealthProtocol;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 安全与健康协议Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsSafetyHealthProtocolService extends IService<SportsSafetyHealthProtocol>
{
    /**
     * 查询安全与健康协议
     * 
     * @param id 安全与健康协议主键
     * @return 安全与健康协议
     */
    public SportsSafetyHealthProtocol selectSportsSafetyHealthProtocolById(Long id);

    /**
     * 查询安全与健康协议列表
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 安全与健康协议集合
     */
    public List<SportsSafetyHealthProtocol> selectSportsSafetyHealthProtocolList(SportsSafetyHealthProtocol sportsSafetyHealthProtocol);

    /**
     * 新增安全与健康协议
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 结果
     */
    public int insertSportsSafetyHealthProtocol(SportsSafetyHealthProtocol sportsSafetyHealthProtocol);

    /**
     * 修改安全与健康协议
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 结果
     */
    public int updateSportsSafetyHealthProtocol(SportsSafetyHealthProtocol sportsSafetyHealthProtocol);

    /**
     * 批量删除安全与健康协议
     * 
     * @param ids 需要删除的安全与健康协议主键集合
     * @return 结果
     */
    public int deleteSportsSafetyHealthProtocolByIds(Long[] ids);

    /**
     * 删除安全与健康协议信息
     * 
     * @param id 安全与健康协议主键
     * @return 结果
     */
    public int deleteSportsSafetyHealthProtocolById(Long id);
}
