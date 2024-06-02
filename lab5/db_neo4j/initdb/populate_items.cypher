/* Populate "Item" (:"Product") entities nodes & corresponding relationships */

/* -- Laptops ("laptops") category items */

MATCH (category:Category {catId: 'laptops'})
MATCH (brand:Brand {brandId: 'Dell'})
CREATE (item:Item:Product
         {
           prodId: '98759e19-e09c-4d5f-8115-f69d935934ee',
           label: "Dell XPS 15 9500",
           info: "The Dell XPS 15 9500 is a powerful laptop designed for professionals and enthusiasts.",
           price: 4599900,
           guarantee: 365,
           stock: 10,
           specCPU: "Intel Core i7-10750H",
           specGPU: "Discrete, NVIDIA GeForce GTX 1650 Ti",
           specRAM: "DDR4 16GB",
           specSSD: "512GB PCIe NVMe",
           specHDD: null,
           specDisplay: "15.6\" 4K UHD+ InfinityEdge Touch",
           specMultimedia: "720p HD webcam, Dual array microphones, Stereo speakers with Waves MaxxAudio Pro",
           specWireless: ["Bluetooth 5.1", "Wi-Fi 6"],
           specConnectors: "2x Thunderbolt 3, 1x USB-C 3.1, 1x SD card reader",
           specOS: "Windows 10 Pro",
           specBattery: "86Whr, Up to 12 hours",
           specFeatures: ["Fingerprint reader", "Backlit keyboard"],
           specSizeLength: 344,
           specSizeWidth: 230,
           specSizeHeight: 18,
           specWeight: 1940,
           specColor: "Platinum Silver with Black carbon fiber palmrest",
           specEquipment: "AC adapter, User documentation"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: "laptops"})
MATCH (brand:Brand {brandId: "Apple"})
CREATE (item:Item:Product
         {
           prodId: 'bcbab644-588a-453a-8e76-bc357ec771f2',
           label: "MacBook Air M1",
           info: "The MacBook Air M1 is the thinnest and lightest MacBook ever, yet it's still powerful.",
           price: 3999900,
           guarantee: 365,
           stock: 8,
           specCPU: "Apple M1 chip",
           specGPU: "Integrated, Apple M1 chip",
           specRAM: "8GB unified memory",
           specSSD: "256GB PCIe-based SSD",
           specHDD: null,
           specDisplay: "13.3\" Retina display with True Tone",
           specMultimedia: "720p FaceTime HD camera, Three-microphone array, Stereo speakers with wide stereo sound",
           specWireless: ["Bluetooth 5.0", "Wi-Fi 6"],
           specConnectors: "2x Thunderbolt 3",
           specOS: "macOS Big Sur",
           specBattery: "49.9Whr, Up to 15 hours",
           specFeatures: ["Touch ID", "Backlit Keyboard"],
           specSizeLength: 304,
           specSizeWidth: 212,
           specSizeHeight: 16,
           specWeight: 1290,
           specColor: "Space Gray",
           specEquipment: "USB-C power adapter, USB-C charge cable (2m)"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: "laptops"})
MATCH (brand:Brand {brandId: "Lenovo"})
CREATE (item:Item:Product
         {
           prodId: '0415ea20-31cc-40f4-886f-c7581980d13b',
           label: "Lenovo Legion 5",
           info: "The Lenovo Legion 5 is a gaming laptop with powerful performance and great cooling.",
           price: 2899900,
           guarantee: 365,
           stock: 6,
           specCPU: "AMD Ryzen 7 4800H",
           specGPU: "Discrete, NVIDIA GeForce GTX 1660 Ti",
           specRAM: "DDR4 16GB",
           specSSD: "512GB NVMe SSD",
           specHDD: "1TB 7200rpm HDD",
           specDisplay: "15.6\" FHD IPS 144Hz",
           specMultimedia: "720p HD camera, Dual speakers with Nahimic 3D Audio",
           specWireless: ["Bluetooth 5.0", "Wi-Fi 6"],
           specConnectors: "4x USB 3.1, 1x HDMI 2.0, 1x RJ45 Ethernet, 1x USB-C",
           specOS: "Windows 10 Home",
           specFeatures: ["Backlit keyboard", "Harman Kardon speakers"],
           specSizeLength: 363,
           specSizeWidth: 260,
           specSizeHeight: 24,
           specWeight: 2300,
           specColor: "Phantom Black",
           specEquipment: "230W AC adapter, Quick start guide"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: "laptops"})
MATCH (brand:Brand {brandId: "HP"})
CREATE (item:Item:Product
         {
           prodId: 'ce8e362b-7d70-4ee8-accf-14e0152c3721',
           label: "HP Spectre x360",
           info: "The HP Spectre x360 is a versatile convertible laptop with stunning design and performance.",
           price: 5499900,
           stock: 5,
           guarantee: 365,
           specCPU: "Intel Core i7-1165G7",
           specGPU: "Intel Iris Xe Graphics",
           specRAM: "DDR4 16GB",
           specSSD: "1TB PCIe NVMe M.2 SSD",
           specHDD: null,
           specDisplay: "13.3\" 4K OLED touchscreen",
           specMultimedia: "HP TrueVision HD IR camera, Dual array digital microphones, Bang & Olufsen speakers",
           specWireless: ["Bluetooth 5.2", "Wi-Fi 6"],
           specConnectors: "2x Thunderbolt 4, 1x USB-A, 1x microSD card reader",
           specOS: "Windows 11 Home",
           specBattery: "4-cell, 66Whr, Up to 16.5 hours",
           specFeatures: ["Fingerprint reader", "Backlit keyboard", "HP Pen support"],
           specSizeLength: 306,
           specSizeWidth: 194,
           specSizeHeight: 17.6,
           specWeight: 1290,
           specColor: "Nightfall Black with Copper Luxe accents",
           specEquipment: "USB-C to USB-C cable, HP Pen, Documentation"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

/* -- Mobile phones ('mobile-phones') category items */

MATCH (category:Category {catId: 'mobile-phones'})
MATCH (brand:Brand {brandId: 'Samsung'})
CREATE (item:Item:Product
         {
           prodId: 'f1f1e9d2-8865-4879-96a8-3fa98cacc216',
           label: "Samsung Galaxy S22 Ultra",
           info: "The Samsung Galaxy S22 Ultra is a flagship smartphone with top-notch features and performance.",
           price: 3499900,
           guarantee: 365,
           stock: 15,
           specCPU: "Exynos 2200",
           specRAM: 12,
           specSdCard: "MicroSDXC (uses shared SIM slot), up to 1TB",
           specStorage: 256,
           specDisplay: "6.8\" Dynamic AMOLED 2X, 120Hz",
           specMainCam: "108MP+12MP+12MP+12MP, OIS, 100x Space Zoom",
           specFrontCam: "40MP, Dual Pixel AF",
           specSensors: ["Accelerometer", "Gyroscope", "Proximity", "Compass"],
           specNavigation: "GPS, Galileo, Glonass, BDS",
           specCommunication: ["5G", "LTE"],
           specSIM: "Dual SIM (Nano-SIM and eSIM)",
           specWireless: ["Bluetooth 5.2", "Wi-Fi 6E"],
           specConnectors: "USB Type-C 3.2",
           specOS: "Android 12 with One UI 5.1",
           specBattery: "5000mAh, Up to 2 days",
           specFeatures: ["IP68 water/dust resistant", "Wireless DeX", "S Pen support"],
           specSizeLength: 166.3,
           specSizeWidth: 77.7,
           specSizeHeight: 8.9,
           specWeight: 228,
           specColor: "Phantom Black",
           specEquipment: "USB-C cable, Ejection pin, Quick start guide"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'mobile-phones'})
MATCH (brand:Brand {brandId: 'Apple'})
CREATE (item:Item:Product
         {
           prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d',
           label: "iPhone 13 Pro Max",
           info: "The iPhone 13 Pro Max is Apple's flagship smartphone with cutting-edge technology and impressive camera capabilities.",
           price: 4399900,
           guarantee: 365,
           stock: 20,
           specCPU: "A15 Bionic chip",
           specRAM: null,
           specSdCard: null,
           specStorage: 512,
           specDisplay: "6.7\" Super Retina XDR OLED, ProMotion, HDR10",
           specMainCam: "12MP (wide) + 12MP (ultra-wide) + 12MP (telephoto), Night mode, Deep Fusion",
           specFrontCam: "12MP TrueDepth, Night mode, Deep Fusion",
           specSensors: ["Face ID", "Accelerometer", "Gyroscope", "Proximity", "Barometer", "LiDAR scanner"],
           specNavigation: "GPS, GLONASS, Galileo, QZSS",
           specCommunication: ["5G", "LTE"],
           specSIM: "Dual SIM (Nano-SIM and eSIM)",
           specWireless: ["Bluetooth 5.0", "Wi-Fi 6"],
           specConnectors: "Lightning",
           specOS: "iOS 15",
           specBattery: "4352mAh, Up to 28 hours talk time",
           specFeatures: ["IP68 water/dust resistant", "MagSafe technology", "Dolby Vision HDR video recording"],
           specSizeLength: 160.8,
           specSizeWidth: 78.1,
           specSizeHeight: 7.65,
           specWeight: 238,
           specColor: "Graphite",
           specEquipment: "USB-C to Lightning cable, Documentation"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'mobile-phones'})
MATCH (brand:Brand {brandId: 'OnePlus'})
CREATE (item:Item:Product
         {
           prodId: '5c7cd55d-14e5-40db-9828-fe2c681e1782',
           label: "OnePlus 10 Pro",
           info: "The OnePlus 10 Pro is a premium smartphone offering powerful performance and sleek design.",
           price: 3399900,
           guarantee: 365,
           stock: 12,
           specCPU: "Snapdragon 8 Gen 2",
           specRAM: 12,
           specSdCard: null,
           specStorage: 256,
           specDisplay: "6.7\" Fluid AMOLED, 120Hz, HDR10+",
           specMainCam: "48MP (wide) + 50MP (ultra-wide) + 8MP (telephoto) + 2MP (monochrome), Hasselblad Color Calibration",
           specFrontCam: "32MP, Auto HDR",
           specSensors: ["Accelerometer", "Gyroscope", "Proximity", "Compass"],
           specNavigation: "GPS, GLONASS, Galileo, BDS",
           specCommunication: ["5G", "LTE"],
           specSIM: "Dual SIM (Nano-SIM and eSIM)",
           specWireless: ["Bluetooth 5.2", "Wi-Fi 6E"],
           specConnectors: "USB Type-C 3.2",
           specOS: "OxygenOS 12 based on Android 12",
           specBattery: "5000mAh, Warp Charge 80T",
           specFeatures: ["IP68 water/dust resistant", "In-display fingerprint sensor", "Stereo speakers"],
           specSizeLength: 163.2,
           specSizeWidth: 73.6,
           specSizeHeight: 8.7,
           specWeight: 206,
           specColor: "Morning Haze",
           specEquipment: "Warp Charge 80T adapter, USB Type-C cable, Quick start guide"}
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'mobile-phones'})
MATCH (brand:Brand {brandId: 'Google'})
CREATE (item:Item:Product
         {
           prodId: '632e8927-3c43-42b5-aaf8-0587df28b0b0',
           label: "Google Pixel 6 Pro",
           info: "The Google Pixel 6 Pro is a flagship smartphone with advanced camera features and smooth performance.",
           price: 4199900,
           guarantee: 365,
           stock: 18,
           specCPU: "Google Tensor",
           specRAM: 12,
           specSdCard: null,
           specStorage: 256,
           specDisplay: "6.7\" Fluid AMOLED, 120Hz, HDR10+",
           specMainCam: "50MP (wide) + 12MP (ultra-wide) + 48MP (telephoto), Night Sight, Super Res Zoom",
           specFrontCam: "11.1MP, Night Sight, Super Res Zoom",
           specSensors: ["Face unlock", "Accelerometer", "Gyrometer", "Barometer", "Magnetometer"],
           specNavigation: "GPS, GLONASS, Galileo, QZSS",
           specCommunication: ["5G", "LTE"],
           specSIM: "Dual SIM (Nano-SIM and eSIM)",
           specWireless: ["Bluetooth 5.2", "Wi-Fi 6E"],
           specConnectors: "USB Type-C 3.1",
           specOS: "Android 12",
           specBattery: "5000mAh, Fast charging 30W",
           specFeatures: ["IP68 water/dust resistant", "Titan M2 security chip", "Google Assistant"],
           specSizeLength: 163.9,
           specSizeWidth: 75.9,
           specSizeHeight: 8.9,
           specWeight: 210,
           specColor: "Stormy Black",
           specEquipment: "USB-C to USB-C cable, SIM tool, Quick start guide"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

/* -- Tablets ('tablets') category items */

MATCH (category:Category {catId: 'tablets'})
MATCH (brand:Brand {brandId: 'Apple'})
CREATE (item:Item:Product
         {
           prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7',
           label: "iPad Air (2023)",
           info: "The iPad Air (2023) combines power and versatility in a sleek and lightweight design.",
           price: 2799900,
           guarantee: 365,
           stock: 8,
           specCPU: "Apple A15 Bionic chip",
           specRAM: 8,
           specSdCard: null,
           specStorage: 256,
           specDisplay: "10.9\" Liquid Retina display with True Tone and P3 wide color",
           specMainCam: "12MP (wide), HDR, 4K video recording",
           specFrontCam: "12MP Ultra Wide, Center Stage",
           specSensors: ["Touch ID", "Three-axis gyro", "Accelerometer", "Barometer"],
           specNavigation: "GPS, GLONASS, Galileo, QZSS",
           specWireless: ["Bluetooth 5.0", "Wi-Fi 6"],
           specConnectors: "USB Type-C 3.1",
           specOS: "iPadOS 15",
           specBattery: "28.6Whr, Up to 10 hours",
           specFeatures: ["Supports Apple Pencil (2nd generation)", "Supports Magic Keyboard and Smart Keyboard Folio"],
           specSizeLength: 247.6,
           specSizeWidth: 178.5,
           specSizeHeight: 6.1,
           specWeight: 458,
           specColor: "Space Gray",
           specEquipment: "USB-C to USB-C Cable, Documentation"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'tablets'})
MATCH (brand:Brand {brandId: 'Samsung'})
CREATE (item:Item:Product
         {
           prodId: '1e8a2ccf-2e25-4476-b250-d28721788269',
           label: "Samsung Galaxy Tab S8+",
           info: "The Samsung Galaxy Tab S8+ is a premium Android tablet with a stunning display and powerful performance.",
           price: 3799900,
           guarantee: 365,
           stock: 6,
           specCPU: "Snapdragon 8 Gen 2",
           specRAM: 8,
           specSdCard: "MicroSDXC (uses shared SIM slot), up to 1TB",
           specStorage: 256,
           specDisplay: "12.4\" Super AMOLED, 120Hz, HDR10+",
           specMainCam: "13MP (wide), HDR, 4K video recording",
           specFrontCam: "8MP, HDR",
           specSensors: ["Accelerometer", "Gyro", "Proximity", "Compass"],
           specNavigation: "GPS, GLONASS, BDS, GALILEO",
           specWireless: ["Bluetooth 5.2", "Wi-Fi 6E"],
           specConnectors: "USB Type-C 3.2",
           specOS: "Android 12 with One UI 4.1",
           specBattery: "10,090mAh",
           specFeatures: ["Fingerprint reader", "Fast charging 45W", "DeX mode support", "S Pen included", "Quad speakers tuned by AKG"],
           specSizeLength: 285.5,
           specSizeWidth: 185,
           specSizeHeight: 5.7,
           specWeight: 575,
           specColor: "Mystic Black",
           specEquipment: "S Pen, USB-C to USB-C cable, Fast charger, Quick start guide"}
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'tablets'})
MATCH (brand:Brand {brandId: 'Amazon'})
CREATE (item:Item:Product
         {
           prodId: '2aba356e-d10e-44c4-8c80-a529c7013f85',
           label: "Amazon Fire HD 10 (2022)",
           info: "The Amazon Fire HD 10 is a budget-friendly tablet offering a large display and access to a wide range of content.",
           price: 199900,
           guarantee: 365,
           stock: 10,
           specCPU: "MediaTek Helio P60T",
           specRAM: 4,
           specSdCard: "MicroSDXC, up to 1TB",
           specStorage: 64,
           specDisplay: "10.1\" 1080p Full HD",
           specMainCam: "5MP (720p HD video recording)",
           specFrontCam: "2MP",
           specSensors: ["Accelerometer", "Ambient light sensor"],
           specNavigation: "GPS, GLONASS",
           specWireless: ["Bluetooth 5.0", "Dual-band Wi-Fi"],
           specConnectors: "USB Type-C 2.0",
           specOS: "Fire OS 8 (based on Android)",
           specBattery: "6,300mAh, Up to 12 hours",
           specFeatures: ["Alexa hands-free", "Dolby Atmos audio", "Expandable storage up to 1TB"],
           specSizeLength: 247,
           specSizeWidth: 166,
           specSizeHeight: 9.2,
           specWeight: 465,
           specColor: "Black",
           specEquipment: "USB-C charging cable, Power adapter"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'tablets'})
MATCH (brand:Brand {brandId: 'Microsoft'})
CREATE (item:Item:Product
         {
           prodId: '58d1f9f5-801c-4ee1-a367-c50141685f9f',
           label: "Microsoft Surface Pro 8",
           info: "The Microsoft Surface Pro 8 is a powerful tablet with the versatility of a laptop, designed for professionals.",
           price: 4199900,
           guarantee: 365,
           stock: 10,
           specCPU: "Intel Core i7-1185G7",
           specRAM: 16,
           specSdCard: null,
           specStorage: 512,
           specDisplay: "13\" PixelSense Flow display, 120Hz",
           specMainCam: "16MP (rear), 4K video",
           specFrontCam: "5MP (front), 1080p video",
           specSensors: ["Ambient light sensor", "Accelerometer", "Gyroscope", "Magnetometer"],
           specWireless: ["Bluetooth 5.0", "Wi-Fi 6E"],
           specConnectors: "USB Type-C 4.0",
           specOS: "Windows 11 Pro",
           specBattery: "56.5Whr, Up to 16 hours",
           specFeatures: ["Windows Hello", "Surface Pen support"],
           specSizeLength: 287,
           specSizeWidth: 208,
           specSizeHeight: 8.5,
           specWeight: 803,
           specColor: "Platinum",
           specEquipment: "Surface Pen, Power supply, Quick start guide"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

/* -- Smartwatches ("smartwatches") category items */

MATCH (category:Category {catId: 'smartwatches'})
MATCH (brand:Brand {brandId: 'Apple'})
CREATE (item:Item:Product
         {
           prodId: 'f771ffbd-66b0-4d19-99f7-974a9d047c87',
           label: "Apple Watch Series 7",
           info: "The Apple Watch Series 7 offers advanced health monitoring and fitness tracking in a sleek design.",
           price: 1499900,
           guarantee: 365,
           stock: 15,
           specDisplay: "LTPO OLED Retina display",
           specSensors: ["Blood oxygen sensor", "ECG app", "Optical heart sensor", "Accelerometer", "Gyroscope", "Ambient light sensor"],
           specFunctions: ["ECG", "Fall detection", "Fitness tracking", "Sleep tracking"],
           specWireless: ["Bluetooth 5.0", "Wi-Fi 802.11b/g/n 2.4GHz"],
           specNavigation: "GPS, GLONASS, Galileo, QZSS",
           specOS: "watchOS 8",
           specHosts: ["iPhone 6s or later with iOS 15 or later"],
           specBattery: "Up to 18 hours",
           specCharging: ["Magnetic charging", "USB Power Adapter"],
           specFeatures: ["Water resistant up to 50 meters", "Always-On Retina display", "Siri"],
           specProtection: ["Water resistant (50m)", "Dust resistant"],
           specSizeLength: 41,
           specSizeWidth: 34,
           specSizeHeight: 10.7,
           specShape: "Rectangular",
           specWeight: 32,
           specColor: "Midnight Aluminum",
           specEquipment: "Magnetic charging cable, USB power adapter, Documentation"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'smartwatches'})
MATCH (brand:Brand {brandId: 'Samsung'})
CREATE (item:Item:Product
         {
           prodId: '8f00c00d-c3dc-480a-a8c1-77341aa613ef',
           label: "Samsung Galaxy Watch 4",
           info: "The Samsung Galaxy Watch 4 combines style with advanced health and fitness features for a comprehensive smartwatch experience.",
           price: 999900,
           guarantee: 365,
           stock: 12,
           specDisplay: "1.19\" AMOLED, Corning Gorilla Glass DX",
           specSensors: ["Heart rate monitor", "ECG", "Accelerometer", "Gyroscope", "Barometer", "Ambient light sensor"],
           specFunctions: ["Advanced sleep tracking", "Fitness tracking", "ECG", "Blood oxygen monitoring"],
           specWireless: ["Bluetooth 5.0", "Wi-Fi 802.11 b/g/n"],
           specNavigation: "GPS, GLONASS, Galileo, BDS",
           specOS: "Wear OS powered by Samsung",
           specBattery: "Up to 40 hours",
           specCharging: ["Wireless charging", "Magnetic charging"],
           specFeatures: ["Samsung Pay", "Bixby"],
           specProtection: ["5ATM", "MIL-STD-810G"],
           specSizeLength: 44,
           specSizeWidth: 44,
           specSizeHeight: 10.9,
           specShape: "Round",
           specWeight: 30,
           specColor: "Black",
           specEquipment: "Wireless charging pad, USB cable, Quick start guide"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'smartwatches'})
MATCH (brand:Brand {brandId: 'Fitbit'})
CREATE (item:Item:Product
         {
           prodId: '5e29b0e0-d88f-4206-bd9c-eb6dc192920c',
           label: "Fitbit Sense",
           info: "The Fitbit Sense is an advanced health smartwatch with stress management tools and built-in GPS for fitness tracking.",
           price: 899900,
           guarantee: 365,
           stock: 10,
           specDisplay: "1.58\" AMOLED, Corning Gorilla Glass 3",
           specSensors: ["ECG", "EDA sensor", "Skin temperature sensor", "Heart rate monitor", "Accelerometer", "Gyroscope", "Ambient light sensor"],
           specFunctions: ["ECG", "Stress management score", "Sleep tracking", "Built-in GPS"],
           specWireless: ["Bluetooth 5.0", "Wi-Fi 802.11 b/g/n"],
           specOS: "Fitbit OS",
           specBattery: "Up to 6 days",
           specCharging: ["Magnetic charging cable"],
           specFeatures: ["Fitbit Pay", "Voice assistant (Amazon Alexa or Google Assistant)"],
           specProtection: ["5ATM"],
           specSizeLength: 40.5,
           specSizeWidth: 40.5,
           specSizeHeight: 12.4,
           specShape: "Round",
           specWeight: 50,
           specColor: "Carbon/Graphite Stainless Steel",
           specEquipment: "Magnetic charging cable, Quick start guide"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);

MATCH (category:Category {catId: 'smartwatches'})
MATCH (brand:Brand {brandId: 'Garmin'})
CREATE (item:Item:Product
         {
           prodId: '09007b6a-bd66-4512-adf4-5af53002e477',
           label: "Garmin Venu 2 Plus",
           info: "The Garmin Venu 2 Plus is a premium GPS smartwatch with advanced health monitoring and music features.",
           price: 1499900,
           guarantee: 365,
           stock: 15,
           specDisplay: "1.3\" AMOLED, Corning Gorilla Glass DX",
           specSensors: ["Heart rate monitor", "Pulse Ox", "Body Battery energy monitor", "Accelerometer", "Gyroscope", "Barometric altimeter", "Compass", "Thermometer"],
           specWireless: ["Bluetooth", "Wi-Fi"],
           specNavigation: "GPS, GLONASS, Galileo",
           specOS: "Garmin OS",
           specBattery: "Up to 11 days",
           specCharging: ["USB charging cable"],
           specFeatures: ["Music storage and playback", "Advanced sleep monitoring", "Garmin Pay"],
           specProtection: ["5ATM", "MIL-STD-810G"],
           specSizeLength: 45.4,
           specSizeWidth: 45.4,
           specSizeHeight: 12.2,
           specShape: "Round",
           specWeight: 50.5,
           specColor: "Granite Blue",
           specEquipment: "USB charging cable, Documentation"
         }
       ),
       (item)-[:BELONGS_TO]->(category),
       (item)-[:LABELED_BY]->(brand);
