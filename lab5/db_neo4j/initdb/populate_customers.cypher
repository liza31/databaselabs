/* Populate "Customer" (:"User") entities nodes */

CREATE (:Customer:User
         {
           userId: 119,
           name: "Oleg",
           surname: "Kovalenko",
           birthday: date('1995-07-20'),
           email: "oleg.kovalenko@gmail.com",
           phone: "+380631234567",
           passCheck: '$2y$12$Ml3J7uHtfxmHxFVt6oZpDuKljAUdqjCvN9.tgFlkW3u47AM6lZJvi',
           otpPhone: true,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 291,
           name: "Irina",
           surname: "Petrenko",
           birthday: date('1989-11-24'),
           email: "irina.petrenko@gmail.com",
           phone: "+380971234567",
           passCheck: '$2y$12$0KJrGxgP8LRT3QCEPnNOFuQwhZL6B5TZiPmtlO2BLf1B8X0vM44nW',
           otpPhone: false,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 294,
           name: "Maksim",
           surname: "Shevchenko",
           birthday: date('1991-08-01'),
           email: "maksim.shevchenko@gmail.com",
           phone: "+380931234567",
           passCheck: '$2y$12$58gqUM5I5NKFfOIMxNTZkOdW2VtJkMbdZbH0pGfNtL7uMh9HJ1V2u',
           otpPhone: false,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 297,
           name: "Alina",
           surname: "Bondarenko",
           birthday: date('2002-06-05'),
           email: "alina.bondarenko@gmail.com",
           phone: "+380661234567",
           passCheck: '$2y$12$5R6IVrXJLq8U9p6FVTL48eUwVDd5JFEgB3IyHj.zgMx0NTVg5INm6',
           otpPhone: true,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 299,
           name: "Natalia",
           surname: "Ivanova",
           birthday: date('1996-04-18'),
           email: "natalia.ivanova@ukr.net",
           phone: "+380681234567",
           passCheck: '$2y$12$kbiJ2Y9qG69AY4Jo/.6I6.ZFQg9GGo8mSB5hJrmwOo/ftrBYG8WKC',
           otpPhone: false,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 300,
           name: "Svetlana",
           surname: "Polishchuk",
           birthday: date('1997-12-27'),
           email: "svetlana.polishchuk@gmail.com",
           phone: "+380991234567",
           passCheck: '$2y$12$KLWCHbKFOUADH9VTNVCn/.1YUyMF1tMXOygw1m35soQHNZFRm1l1m',
           otpPhone: false,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 301,
           name: "Viktor",
           surname: "Dmitriev",
           birthday: date('1987-03-19'),
           email: "viktor.dmitriev@gmail.com",
           phone: "+380921234567",
           passCheck: '$2y$12$KByQ/z8mzkwKXX1P8iPN5.CNEh.lMUyNzqPUOYzLqVEJWplLXnoGK',
           otpPhone: false,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 303,
           name: "Olga",
           surname: "Tkachenko",
           birthday: date('1999-09-14'),
           email: "olga.tkachenko@ukr.net",
           phone: "+380671234567",
           passCheck: '$2y$12$VnIzA0Tz5I1SZ3j8COlyOuuDSSJxzGmK1wU3qMZDxqJr.pBuQU3tq',
           otpPhone: false,
           otpEmail: true
         }
       ),
       (:Customer:User
         {
           userId: 304,
           name: "Dmitry",
           surname: "Sokolov",
           birthday: date('1994-06-26'),
           email: "dmitry.sokolov@gmail.com",
           phone: "+380961234567",
           passCheck: '$2y$12$ksYbkV4mBVh.9T8QZI50gu2u6sWbChAXRtzPOh6P62pIzZvqfOuOe',
           otpPhone: false,
           otpEmail: false
         }
       ),
       (:Customer:User
         {
           userId: 307,
           name: "Yuriy",
           surname: "Grigorenko",
           birthday: date('1990-05-29'),
           email: "yuriy.grigorenko@gmail.com",
           phone: "+380731234567",
           passCheck: '$2y$12$nd6quf9T2xLvfSmgWf.Mb.yepZS5OKrJr6gDZIgQF/UlDZNNeyy0e',
           otpPhone: false,
           otpEmail: false
         }
       )
