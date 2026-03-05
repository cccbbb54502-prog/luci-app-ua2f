m = Map("autoua2f", translate("UA2F"))
m.description = translate([[
        <span style="font-family: '微软雅黑'; color: red">此页面为ua2f绕过修改界面，请勿乱动以免出错
        <br/>
        <a href="http://www.nd7.top/index.php/2026/03/01/%e6%a0%a1%e5%9b%ad%e7%bd%91%e8%b7%af%e7%94%b1%e5%99%a8%e4%bd%bf%e7%94%a8%e6%95%99%e7%a8%8b/" target="_blank" style="color: #00a2ff; text-decoration: underline; margin-left: 5px;">
            [点击进入路由器教程网址]
        </a>
        </span>
    ]])
    
m:section(SimpleSection).template = "ua2f/ua2f"
m:section(SimpleSection).template = "ua2f/ua2f_A"

e = m:section(TypedSection, "autoua2f", translate(""))
e.addremove = false
e.anonymous = true

o1 = e:option(Flag, "enabled", translate("启用/开机自启"))
o1.rmempty = false

o2 = e:option(Flag, "handle_fw", translate("自动配置防火墙"), translate("是否自动添加防火墙规则"))
o2.rmempty = false


o3 = e:option(Flag, "handle_intranet", translate("处理内网流量"), translate("是否处理内网流量，如果你的路由器是在内网中，且你想要处理内网中的流量，那么请启用这一选项"))
o3.rmempty = false

o4 = e:option(Flag, "handle_tls", translate("处理443端口流量"), translate("通常来说，流经 443 端口的流量是加密的，因此无需处理"))
o4.rmempty = false

o5 = e:option(Flag, "handle_mmtls", translate("处理微信流量"), translate("微信的流量通常是加密的，因此无需处理，这一规则在启用 nftables 时无效"))
o5.rmempty = false

o6 = e:option(Value, "Custom_UA", translate("自定义用户代理"), translate("自定义用户代理字符串，长度不足则填充空格，过长则截取与原来长度相同的子串"))
o6.default = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/555.66"

m.on_commit = function(self)
    luci.sys.call("/etc/init.d/autoua2f start")
end

return m
