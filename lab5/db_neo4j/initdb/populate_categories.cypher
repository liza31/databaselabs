/* Populate "Category" entities nodes */

CREATE (:Category
         {
           catId: 'laptops',
           label: "Laptops",
           info: "Portable personal computers designed for mobile use"
         }
       ),
       (:Category
         {
           catId: 'mobile-phones',
           label: "Mobile Phones",
           info: "Portable communication devices for voice and data communication"
         }
       ),
       (:Category
         {
           catId: 'tablets',
           label: "Tablets",
           info: "Mobile devices with touchscreen display, typically larger than smartphones"
         }
       ),
       (:Category
         {
           catId: 'smartwatches',
           label: "Smartwatches",
           info: "Wearable computing devices designed to be worn on the wrist"
         }
       );
