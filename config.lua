Config   = {}

-- @เปิดสำหรับเบสที่ใช้ getAccount เท่านั้น เบสรุ่นเก่าให้ปิดเพื่อใช้ getMoney
Config.NewESXVersion = true

-- @ฟ้อนที่ตัวเองมี
Config.Fonts = 'font4thai'

-- @ความสูงของ Text3D
Config.HighText = 0.5

-- @ตั้งค่าวาป
Config.TeleportList = {
    [1] = {
        title = '[E] - เพื่อเข้า',             -- @ข้อความบน Text3D
        progress = 'โปรดรอสักครู่...',         -- @ข้อความบน หลอดโหลด
        time = 3,                           -- @เวลาล็อคขา
        bypassMoney = {                     -- @หัวข้อ ที่จะให้เช็คก่อนวาป ปิดเปิดได้
            enable = true,                  -- @ปิดเปิด ให้ไม่เช็คและลบเงินเมื่อวาป
            type = 'money',                 -- @สำหรับคนที่ใช้ getAccount เท่านั้น ถ้าคนใช้ getMoney จะหักเงินในเป๋าเลย อยากได้เพิ่มเขียนเอา
            amount = 20                     -- @จำนวนเงินที่หัก
        },
        bypassItems = {                     -- @หัวข้อเช็คไอเทมก่อนวาป
            enable = true,                  -- @เปิดปิดเช็คไอเทม
            remove = true,                  -- @จะให้ลบไอเทมไหม?
            items = 'crad_warp'             -- @ไอเทมที่ต้องมีใน database
        },
        marker = {                          -- @หัวข้อของ มาร์คเกอร์
            distance = 5,                   -- @ระยะการมองเห็นของ มาร์คเกอร์
            type = 22,                      -- @ประเภทของมาร์คเกอร์  -- https://docs.fivem.net/docs/game-references/markers/
            size = { x = 0.5, y = 0.5, z = 0.5 },   -- @ขนาดของ มาร์คเกอร์
            color = { r = 255, g = 255, b = 255 }   -- @สีของ มาร์คเกอร์
        },
        enableVehicle = false,              -- @ห้ใช้รถขณะที่วาปได้ไหม?
        coords = vector3(-1911.4304, -575.7985, 19.0969),       -- @จุดตั้ง
        gotocoords = vector3(-1910.2639, -574.5815, 19.0972)    -- @จุดหมาย
    },
    [2] = {
        title = '[E] - เพื่อออก',
        progress = 'โปรดรอสักครู่...',
        time = 3,
        bypassMoney = {
            enable = true,
            type = 'money',
            amount = 20
        },
        bypassItems = {
            enable = true,
            remove = true,
            items = 'crad_warp'
        },
        marker = {
            distance = 5,
            type = 22,
            size = { x = 0.5, y = 0.5, z = 0.5 },
            color = { r = 255, g = 255, b = 255 }
        },
        enableVehicle = false,
        coords = vector3(-1910.2639, -574.5815, 19.0972),
        gotocoords = vector3(-1911.4304, -575.7985, 19.0969)
    },
}


-- @ตั้งค่าแจ้งเตือนของตัวเอง
Config.Notification = function(title, text, time, type)

    -- @okokNotify
    -- exports.okokNotify:Alert(title, text, time, type)

    -- @pNotify
    -- exports.pNotify:SendNotification({
	--     text = text,
	--     type = type,
	-- 	timeout = time, 
	-- 	layout = "bottomCenter",
	-- })
end