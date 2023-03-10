//
//  BeansCategory.swift
//  CulinaryWay
//
//  Created by MacBook Air on 15.12.2022.
//

import Foundation

struct CustomCell {
    var image: String
    var dish: String
   
}
struct CustomCellDescription {
    var description: String
}

var dishNames: [CustomCell] = []

var savedRecipe: [Dish] = []

var storedImages: [String] = []

let dalData = [
CustomCell(image: "Чанна Масала",
            dish: "Чанна Масала\n\nШАГ 1 \n\nПоставьте варить нут. Слейте воду с нута, добавьте в большую кастрюлю с 400 мл воды и приправьте. Доведите до кипения, затем выключите огонь и отставьте в сторону, чтобы аромат нута пропитал воду.\n\nШаг 2 \n\nСмешайте имбирь с зеленым перцем чили. Растопите топленое масло в большой кастрюле, затем добавьте имбирную смесь с щепоткой соли и готовьте 8-10 минут, пока не станет мягким.\n\nШАГ 3 \n\nДобавьте специи и готовьте еще 3 минуты, добавив немного воды из нута, чтобы они не прилипали ко дну кастрюли. Добавьте помидоры и еще немного воды и готовьте 5 минут, разминая помидоры ложкой, пока они не станут мягкими. Добавьте нут вместе с водой, в которой он варился. Варить 10 мин. Хорошо приправьте, добавьте лимонный сок и немного воды, если вам нравится более рассыпчатое карри. Посыпать кориандром для подачи."),
CustomCell(image: "Доса",
            dish: "Доса\n\nШаг 1\n\nДля этого простого рецепта замочите рис и дал на ночь. На следующее утро измельчите рис, дал и кокосовую стружку, чтобы получилась паста. Порциями добавляйте воду и снова перемалывайте, чтобы тесто стало жидкой консистенции. Добавьте соль и перемешайте.\n\nШаг 2\n\nТеперь поставьте смесь в теплое место и дайте настояться 5-6 часов. После брожения тесто для досы готово.\n\nШаг 3\n\nРазогрейте сковороду с антипригарным покрытием, налейте на нее немного масла, налейте ложкой тесто и равномерно распределите его. Уменьшите огонь и накройте сковороду на минуту или около того. Затем капните несколько капель масла вокруг досы. Как только он станет коричневым и хрустящим, доса готова.\n\nШаг 4\n\nПодавайте с самбаром или чатни."),
CustomCell(image: "Урид Дал Пакора",
           dish: "Урид Дал Пакора\n\nШаг 1\n\nДля начала замочите черную чечевицу на ночь в воде. На следующее утро слейте воду и измельчите дал в кофемолке, чтобы получилась однородная паста. К этой пасте добавьте нарезанный лук, листья кориандра, перец чили, порошок тмина, гарам масала и соль.\n\nШаг 2\n\nТщательно перемешайте. Сделайте из этой смеси маленькие шарики, нанеся на ладони немного воды/масла. В миску, полную семян кунжута, опустите эти шарики и полностью покройте их семенами. Возьмите кадаи, разогрейте в нем масло на среднем огне и обжарьте эти шарики во фритюре. Переложите на тарелку и подавайте горячим с чатни или кетчупом."),
CustomCell(image: "Дал",
           dish: "Дал\n\nШаг 1\n\nДал — это смесь вкуснейшего дала и специй. Вот как вы можете сделать это дома. Возьмите скороварку и наполните ее 4 стаканами воды. Теперь добавьте в воду тур дал, чана дал и масур дал. Добавьте в скороварку соль, закройте крышку и готовьте на среднем огне.\n\nШаг 2\n\nТеперь возьмите сковороду с антипригарным покрытием и нагрейте 4 ч. л. гхи на среднем огне. Затем добавьте по 1 столовой ложке измельченного имбиря. Добавьте нарезанный зеленый перец чили.\n\nШаг 3\n\nДобавить специи, варить, пока овощи не станут мягкими.Добавьте нарезанные помидоры и приправьте куркумой и красным перцем чили. Варить до тех пор, пока помидоры не станут мягкими.\n\nШаг 4\n\n Добавьте приготовленный дал, воду и дайте ему закипеть.Теперь откройте крышку скороварки и добавьте приготовленный дал в кастрюлю. Также добавьте 2 стакана воды и хорошо перемешайте. Посыпать солью и варить на среднем огне 5 минут. Дайте ему приготовиться и загустеть.\n\nШаг 5\n\nВремя от времени помешивайте, чтобы проверить консистенцию дала, затем снимите с огня и осторожно переложите в большую миску и оставьте в стороне. Тем временем возьмите небольшую кастрюлю, нагрейте оставшееся топленое масло на среднем огне, добавьте семена тмина и растолочь два сухих красных перца чили. Затем добавьте асафетиду и прогрейте несколько секунд. Получившуюся тарку добавьте в дал. Дал готов."),
CustomCell(image: "Раджма Масала",
           dish: "Раджма Масала\n\nШаг 1\n\nЗамочите красную фасоль на ночь или хотя бы на 10 часов, а затем варите на среднем огне с достаточным количеством воды.\n\nШаг 2\n\nКогда раджма закипит, поставьте сковороду на средний огонь и разогрейте в ней масло. Когда масло достаточно нагреется, добавьте в него семена тмина вместе с асафетидой, лавровым листом, листьями карри и дайте им прогреться. Добавьте в сковороду имбирную пасту вместе с пастой из зеленого перца чили и обжаривайте до светло-золотистого цвета.\n\nШаг 3\n\nЗатем добавьте в сковороду пасту из жареного томатного пюре и обжаривайте, пока вы не заметите изменение цвета пюре. Теперь добавьте в пюре все специи - куркуму, красный перец чили, порошок тмина и кориандра вместе с йогуртом. Хорошо перемешайте и дайте пюре вариться около 2 минут.\n\nШаг 4\n\nДобавьте приготовленную раджму в кастрюлю с бульоном или 1 чашкой воды и аккуратно перемешайте с приготовленным пюре. Затем добавьте соль, сахар и порошок гарам масала. Добавьте немного кориандра для аромата и варите подливу 4-5 минут на среднем огне. (Необязательно: вы также можете использовать специю раджма масала, если она доступна.)\n\nШаг 5\n\nРаджма масала готова, украсьте листьями кориандра и полейте сверху небольшим количеством сливочного масла. Хорошо перемешайте и подавайте с нааном, роти с маслом или отварным рисом. Наслаждайтесь!"),
CustomCell(image: "Кхичри",
               dish: "Кхичди\n\nШаг 1\n\nПодсушите чечевицу и промойте рис и чечевицу.Сначала помойте далс и замочите его на некоторое время в воде. Далее берем миску и промываем рис в проточной воде 5-6 раз и замачиваем на полчаса.\n\nШаг 2\n\nТеперь поставьте скороварку на средний огонь и нагрейте в ней топленое масло. Когда топленое масло достаточно нагреется, добавьте семена тмина, лавровый лист, асафетиду, корицу в топленое масло и обжарьте их в течение нескольких секунд. Затем добавьте куркуму, имбирную пасту и обжаривайте 2-3 минуты. Наконец, добавьте картофель, горох и цветную капусту вместе с солью и сахаром. Хорошо перемешайте и готовьте на среднем или сильном огне 2-3 минуты. Когда овощи приготовятся, добавьте в них замоченный рис вместе с далом. Хорошо перемешать все ингредиенты и варить 4-5 минут.\n\nШаг 3\n\nТеперь добавьте к рису 3-4 стакана воды и закройте скороварку крышкой. Готовьте под давлением в течение 3 свистков и выключите пламя. Дайте пару выпуститься самостоятельно и подавайте горячим с небольшим количеством топленого масла, папада, ачаара и райты.\n\nШаг 4\n\nСоветы по приготовлению идеального кичди в домашних условиях\n\n1. Хорошо приготовленный кичди вкусный, богатый белком и полезный. И лучший способ сделать это дома — сделать это простым способом с меньшим количеством специй. Старайтесь использовать при приготовлении блюда только асафетиду, семена тмина и куркуму.\n2. Чтобы сделать кичди более питательным, в него можно добавить немного проса. Это также улучшит вкус кичди.\n3. Вы также можете добавить больше овощей, чтобы сделать кичди более вкусным и ярким.\n4. Для приготовления кичди можно использовать круглозерный рис или даже коричневый рис."),
]
let dalPictures = ["Чанна Масала", "Доса", "Урид Дал Пакора", "Дал", "Раджма Масала", "Кхичри"]


let riceData = [
CustomCell(image: "Пулао",
           dish: "Пулао\n\nШаг 1\n\nДобавьте масло в сковороду с антипригарным покрытием и нагрейте на среднем огне. Как только масло станет достаточно горячим, добавьте все специи вместе с овощами (не ростками и соей). Готовьте 2 минуты, а затем добавьте нарезанные помидоры.\n\nШаг 2\n\nХорошо перемешайте ингредиенты и готовьте (под крышкой 1/4 стакана воды), пока самые твердые овощи (в данном случае морковь) не станут слегка мягкими. Это должно занять около 5-8 минут. Удостоверьтесь, что пламя находится на низком-умеренном пламени.\n\nШаг 3\n\nЧерез 5-8 минут проверьте. Если овощи хорошо прожарились, добавьте ростки и сою и помешивайте 2-3 минуты на умеренном огне. Как только это будет сделано, добавьте осушенный коричневый рис с солью и порошком чили. На этом этапе вы также можете добавить любые другие любимые масалы. Перемешивайте, пока рис не начнет образовывать комки.\n\nШаг 4\n\nЗатем добавьте 2 стакана воды и доведите всю кастрюлю до кипения. После первого закипания варить на медленном огне под крышкой до готовности риса (обычно около 8 минут). Выключите огонь и переложите овощной пулао в сервировочную миску. Подавать горячим с бунди или огуречной райтой."),
    CustomCell(image: "Кхир",
               dish: "Кхир\n\nШаг 1\n\nПромойте рис и замочите его на 15-20 минут. Убедитесь, что рис, который вы используете, ароматный. Вскипятите молоко и положите одну столовую ложку кипяченого молока в миску. Когда смесь нагреется, добавьте несколько нитей шафрана в столовую ложку молока.\n\nШаг 2\n\nПока молоко кипит, слейте всю воду с риса и добавьте его в молоко. Отварите рис на медленном огне до полуготовности, затем добавьте сахар по мере необходимости и продолжайте варить. Варить рис почти до готовности. Пламя должно быть низким, и вы должны продолжать помешивать.\n\nШаг 3\n\nВарите кхир, пока он не загустеет, и добавьте сухофрукты. Добавьте к рису половину чайной ложки порошка кардамона, нарезанные кешью, нарезанные фисташки и растворенное в шафране молоко. Перемешайте и продолжайте готовить. Как только рисовые зерна сварятся и кхир загустеет, соскребите со стенок твердые частицы молока и добавьте их в кхир.\n\nШаг 4\n\nУкрасьте кхир одной столовой ложкой золотого изюма (изюм) и подавайте горячим или холодным. (Совет: добавьте одну столовую ложку розовой воды или кевровой воды, чтобы усилить вкус.)")
]
let ricePictures = ["Пулао", "Кхир"]



let breadData = [
CustomCell(image: "Роти",
           dish: "Роти\n\nШаг 1\n\nЧтобы приготовить этот восхитительный рецепт, соберите все ингредиенты и смешайте их, чтобы получилось гладкое и густое тесто. Используйте соответствующее количество воды для замешивания теста.\n\nШаг 2\n\nРазогрейте антипригарную сковороду на среднем или слабом огне. Тем временем скатайте из теста небольшие шарики и раскатайте их скалкой. Переверните чапати на сковороду и готовьте. Пока роти готовится, смажьте каждую сторону небольшим количеством топленого масла. Готовьте бесан роти, пока они не станут золотистыми и не станут видны темные пятна. Повторите то же самое с остальным тестом, лучше всего подавать горячим и свежим."),
CustomCell(image: "Пури",
           dish: "Пури\n\nШаг 1\n\nВ большую миску добавьте рисовую муку, порошок тмина, порошок касури мети, соль, порошок семян фенхеля и порошок кориандра. Хорошенько перемешайте все ингредиенты. Теперь в кастрюле вскипятите воду на среднем огне, а затем выключите ручку газа, как только вода закипит. Добавьте эту горячую воду в миску и дайте ей остыть.\n\nШаг 2\n\nЧерез некоторое время замесить мягкое тесто. Накройте эту миску тканью или пищевой пленкой и оставьте минимум на 10 минут. Начните формировать из него небольшие шарики из теста и раскатайте их скалкой на смазанной маслом доске. Проделайте то же самое с оставшимся тестом.\n\nШаг 3\n\nТеперь разогрейте масло в глубокой неглубокой сковороде на среднем огне и, как только оно станет достаточно горячим, осторожно положите в него плоское тесто. Плотно прижмите пури ковшом, чтобы он вздулся. Переверните стороны, чтобы он стал золотисто-коричневым со всех сторон или пока хорошо не прожарится. Таким же образом обжарьте другие лепешки. Ваше рисовое пури готово. Переложите их на сервировочные тарелки и подавайте горячими с маринадом или любым карри. Наслаждаться."),
CustomCell(image: "Самоса", dish: "Самоса\n\nШаг 1\n\nНачните с приготовления теста для самосы. В большую миску добавьте муку, аджван, соль и хорошо перемешайте. Добавьте масло, а затем начните смешивать пальцами. Растереть муку с маслом, пока масло не смешается со всей мукой. Делайте это в течение 3-4 минут, не торопитесь с этим шагом.\n\nШаг 2\n\nНадавите немного на тесто между ладонями —  должна сформироваться форма (не крошиться) — это означает, что масла достаточно и оно хорошо перемешано. Теперь начните понемногу добавлять воду и замесить крутое тесто. Не переусердствуйте с тестом и не месите мягкое тесто. Оно должно просто собраться и сформировать плотное тесто. Я использовал около 6 столовых ложек воды здесь. Накройте тесто влажной тканью и оставьте на 40 минут. Обычно я замачиваю бумажное полотенце в воде, затем выжимаю всю воду и накрываю этим тесто.\n\nШаг 3\n\nОтварить картофель до готовности. От 8 до 9 свистков на сильном огне с естественным сбросом давления при использовании скороварки на плите или при использовании Instant Pot, высокое давление 12 минут с естественным сбросом давления на подставке с 1 чашкой воды на дне кастрюли. Очистить кожуру и размять картофель. Отложите. Нагрейте 2 столовые ложки масла в сковороде на среднем огне. Как только масло нагреется, добавьте семена тмина, семена фенхеля и измельченные семена кориандра. Дайте семенам покипеть несколько секунд, а затем добавьте нарезанный имбирь, зеленый перец чили и хинг. Варить 1 минуту.\n\nШаг 4\n\nДобавьте в кастрюлю отварной и пюреобразный картофель и зеленый горошек. Смешайте все вместе. Я использую картофелемялку, чтобы хорошо смешать специи и приправы с картофелем и горошком. Добавьте порошок кориандра, гарам масала, амчур, красный перец чили и соль. Смешайте, чтобы объединить. Когда все хорошо перемешается, снимите кастрюлю с огня и дайте начинке немного остыть.\n\nШаг 5\n\nПосле того, как тесто отдохнуло, быстро вымесите его. Затем разделите тесто на 7 равных частей по 58-60 грамм каждая. Начните работать с кусочком теста, держите оставшиеся шарики теста все время накрытыми влажной тканью, иначе тесто высохнет. Раскатайте один шарик теста в круглую овальную форму диаметром около 6-7 дюймов, а затем разрежьте его на две части. Возьмите одну часть и нанесите воду на прямой край/сторону. Я обычно смешиваю немного муки с водой, чтобы получился хороший клей. Теперь соедините два конца линейки вместе и защипните их, чтобы получился конус. Смотрите картинку (#20) для лучшего понимания.\n\nШаг 6\n\nСожмите заостренные концы, чтобы получилась идеальная форма конуса. Наполните самосу картофельной начинкой, примерно 1-2 столовые ложки. Не переполняйте самсу. Теперь снова нанесите воду по всему периметру конуса, чтобы запечатать его. Защипните противоположную сторону (сторону, противоположную той, где вы защипывали, чтобы сформировать конус), чтобы сформировать тарелку (см. рисунок № 23). Теперь защипните края и запечатайте самосу.\n\nШаг 7\n\nВаша самса готова. Повторить с оставшимся тестом. Всегда помните, чтобы заполненная самоса была покрыта влажной тканью, пока сворачивайте и наполняйте другие. Теперь разогрейте масло в кадаи на медленном огне. Чтобы проверить, готово ли масло, опустите в масло небольшой кусочек теста. Должно пройти несколько секунд, чтобы всплыть на поверхность. Это означает, что масло готово. Опустите сформированные самосы в масло. Жарить на медленном огне. Примерно через 10-12 минут самоса станет твердой и светло-коричневого цвета. В этот момент увеличьте огонь до среднего и жарьте, пока он не подрумянится. Не переполняйте кадай/вок, жарьте 4-5 самос за раз. И на каждую партию уйдет около 20 минут, так как мы жарим на слабом огне, так что наберитесь терпения.")
]
let breadPictures = ["Роти", "Пури", "Самоса"]



let dessertData = [
CustomCell(image: "Шакхар Пали",
           dish: "Шакхар Пали\n\nШаг 1\n\nЧтобы приготовить этот аппетитный рецепт, начните с предварительного разогрева духовки до 200 градусов по Цельсию, смажьте противень топленым маслом и посыпьте его мукой.\n\nШаг 2\n\nТеперь возьмите большую миску и смешайте цельнозерновую муку с рафинированной мукой вместе с разрыхлителем. Затем добавьте топленое масло и перемешайте пальцами, чтобы получить рассыпчатую консистенцию. Добавьте соль вместе с аджваином и черным перцем и смешайте с холодной водой, чтобы получилось крутое тесто.\n\nШаг 3\n\nНакройте миску влажной тканью и оставьте на 10-15 минут. Когда тесто будет готово, посыпьте плоскую поверхность небольшим количеством муки и с помощью скалки раскатайте тесто, чтобы сформировать чапати.\n\nШаг 4\n\nТеперь вырежьте ромбы или длинные палочки и поместите их на смазанный жиром противень. Выпекайте намак-парас в течение 15-20 минут или пока они не станут светло-золотисто-коричневого цвета. Затем переложите их на сервировочный поднос.\n\nШаг 5\n\nПодавайте вкусное угощение с чашкой горячего чая или храните его в герметичном контейнере на потом."),
CustomCell(image: "Гуджия",
           dish: "Гуджия\n\nШаг 1\n\nЭтот популярный рецепт гуджии можно приготовить, выполнив несколько простых шагов, приведенных ниже. Возьмите миску, добавьте муку и воду, чтобы получилось мягкое тесто. Чтобы подчеркнуть вкус этого традиционного рецепта, добавьте в тесто немного топленого масла.\n\nШаг 2\n\nЧтобы тесто стало мягким, хорошо вымесите его, сбрызнув небольшим количеством воды. Когда тесто станет идеальной консистенции, оставьте его на час. Тем временем возьмите глубокую сковороду, обжарьте хою и манную крупу, пока она не станет золотистой, и оставьте в стороне, чтобы она остыла.\n\nШаг 3\n\nДобавьте в остывшую хойю сахар, зеленый кардамон и замоченный миндаль и хорошо перемешайте. Чтобы сделать эту начинку еще вкуснее, добавьте немного сухих жареных орехов и изюм, это добавит приятный хруст к рецепту Гуджия. Переходя к следующему шагу, возьмите две капли гхи или рафинированного масла и хорошо распределите их по ладоням.\n\nШаг 4\n\nЗатем слепите из теста небольшие круглые шарики и сделайте в них углубления в виде чашек, чтобы наполнить их роскошной начинкой. После добавления начинки защипните углы таким образом, чтобы закрепить начинку во время жарки гуджии. Сверните стороны в соответствии с вашим выбором шаблона.\n\nШаг 5\n\nНагрейте гхи в кастрюле на среднем огне. Обжарьте гуджии до золотистого цвета со всех сторон и подавайте с тандай и острыми пакорами. Украсьте его полосками шафрана и измельченными фисташками. Вы также можете подать его с небольшим количеством рабри.\n\n")
]
let dessertPictures = ["Шакхар Пали", "Гуджия"]


let drinksData = [
CustomCell(image: "Масала чай",
           dish: "Масала чай\n\nШАГ 1\n\nДля настоя поместите семена кардамона в ступку вместе с корицей, гвоздикой и перцем и разотрите, чтобы выпустить масла.Переложите в кастрюлю и добавьте имбирь и листья черного чая.\n\nШАГ 2\n\nВлейте 400 мл воды и доведите до очень слабого кипения на медленном огне, чтобы чай настоялся до того, как он закипит. Добавьте молоко и сахар или сироп по вкусу и снимите с огня. Дать настояться 2 минуты, затем разлить по кружкам."),
CustomCell(image: "Бадам милк",
           dish: "Бадам милк\n\nШАГ 1\n\nЗамочите миндаль в горячей воде на 20 минут.Через 20 минут слейте воду и снимите кожицу с каждого миндаля. Она легко сойдет.\n\nШАГ 2\n\nПереложите бланшированный миндаль с ¼ стакана молока в блендер. Смешайте до однородной пасты. Отложите это.\n\nШАГ 3\n\nТеперь перелейте оставшееся молоко в кастрюлю и поставьте на средний огонь. Когда молоко нагреется, вылейте 1 столовую ложку теплого молока из кастрюли в маленькую миску и добавьте к нему измельченные нити шафрана. Отложите.\n\nШАГ 4\n\n Как только молоко в кастрюле закипит, добавьте в него приготовленную миндальную пасту. Перемешайте.\n\nШАГ 5\n\nУменьшите огонь до среднего и дайте молоку кипеть 15-20 минут. Часто помешивайте, чтобы молоко не прилипло ко дну кастрюли. Сырой запах миндаля должен полностью исчезнуть.\n\nШАГ 6\n\nДобавьте шафрановое молоко, которое вы отложили.\n\nШАГ 7\n\nЗатем добавьте сахар и перемешайте, пока он не растворится.\n\nШАГ 8\n\nНаконец, добавьте измельченные семена кардамона. Вы также можете добавить розовую воду (если используете) на этом этапе.\n\nШАГ 9\n\nСмешайте все вместе и выключите огонь. Подавайте молоко бадам горячим или холодным.")
]
let drinksPictures = ["Масала чай", "Бадам милк"]

let chutneyData = [
CustomCell(image: "Кокосовый чатни", dish: "Кокосовый чатни\n\nШАГ 1\n\nНа сковороде разогрейте 2 чайные ложки масла и обжарьте ¼ чашки арахиса, пока он не станет хрустящим.\n\nШАГ 2\n\nДобавьте 3 сушеных красных перца чили и обжаривайте, пока перец не набухнет. Полностью остудить и переложить в чашу миксера.\n\nШАГ 3\n\nДобавьте ½ стакана кокосовой стружки, небольшой кусочек тамаринда и ½ ч. л. соли. Измельчить в мелкий порошок без добавления воды.\n\nШАГ 4\n\nТеперь добавьте ½ стакана воды и измельчите до однородной пасты. Наслаждайтесь кокосово-арахисовым чатни с идли или досой.")
]
let chutneyPictures = ["Кокосовый чатни"]

let sabjiData = [
CustomCell(image: "Овощное Сабджи", dish: "Овощное Сабджи\n\nШАГ 1\n\nВ глубокой сковороде или карахи (вок) разогрейте масло и добавьте семена тмина. Обжаривайте на среднем огне.\n\nШАГ 2\n\nДобавьте имбирь, помидоры. Готовьте, пока помидоры не начнут распадаться, затем добавьте остальные специи и соль. (5 минут)\n\nШАГ 3\n\nДобавьте овощи и хорошо перемешайте. Добавьте немного воды и накройте кастрюлю. Варить на среднем огне до готовности овощей. (12-15 минут)"),
CustomCell(image: "Алу Сабджи", dish: "Алу Сабджи\n\nШАГ 1\n\nПоложите картофель в большую кастрюлю и полностью залейте водой. Доведите до кипения и уменьшите огонь. Варить, пока картофель не станет мягким (примерно 20 минут). Проверьте, воткнув вилку в одну картофелину; он должен пройти с небольшим сопротивлением. После этого слейте воду и промойте картофель под холодной проточной водой. Очистите и нарежьте небольшими кубиками.\n\nШАГ 2\n\nМелко нарежьте кинзу. Поджарьте и измельчите семена кориандра: возьмите небольшую сковороду и поставьте ее на средний огонь. Добавьте семена кориандра и перемешайте их ложкой, пока они слегка не изменят цвет и не дадут отчетливый аромат. Снимите с огня и дайте им немного остыть, затем измельчите в кофемолке или кофемолке.\n\nШАГ 3\n\nПоставьте карахи (вок) или небольшую кастрюлю на средний огонь и добавьте семена тмина. Когда они начнут шипеть, добавьте лук и чеснок. Жарьте, пока лук не станет красновато-коричневым. Добавьте картофель и молотые специи. Перемешайте ложкой, чтобы картофель покрылся специями, и готовьте всего 4-5 минут. Не добавляйте воду. В конце добавьте нарезанную кинзу. Сверху добавьте нарезанный зеленый перец чили и лимонный сок, если используете. Подавайте горячим с хлебом на ваш выбор. ")
]
let sabjiPictures = ["Овощное Сабджи", "Алу Сабджи"]


