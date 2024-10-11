import 'package:flutter/material.dart';
import 'models/news.dart'; // Import the News model
import 'package:url_launcher/url_launcher.dart'; // For launching URLs


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
//Dark and light mode
class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;
  bool _isLoggedIn = false; // Track login state

  void toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme; // Toggle the theme
    });
  }

  void handleLoginSuccess() {
    setState(() {
      _isLoggedIn = true; // Set login state to true after login success
    });
  }
//title & login support
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Times',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(), // Theme selection
      home: _isLoggedIn
          ? NewsListScreen(
              toggleTheme: toggleTheme,
              isDarkTheme: _isDarkTheme,
            )
          : LoginScreen(onLoginSuccess: handleLoginSuccess), // Show login or news screen
      debugShowCheckedModeBanner: false,
    );
  }
}

// NewsListScreen Class
class NewsListScreen extends StatefulWidget {
  final VoidCallback toggleTheme; // Callback for toggling theme
  final bool isDarkTheme; // Track if dark theme is active

  const NewsListScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkTheme,
  });

  @override
  NewsListScreenState createState() => NewsListScreenState();
}

class NewsListScreenState extends State<NewsListScreen> {
  List<News> _newsList = [];
  List<News> _filteredNewsList = [];
//All News  
  @override
  void initState() {
    super.initState();
    _newsList = [

      News(
        title: 'Third Eye',
        description: 'Following the encounter of a man said to have sexually assaulted two kindergarten girls, the BJP credited deputy CM and home minister Devendra Fadnavis, while the Shiv Sena credited Maharashtra CM Eknath Shinde.',
        imageUrl: 'https://media.assettype.com/sarkarnama%2F2024-06%2F2d944e81-65f8-4f6e-8b14-867a950f9f77%2FEknath_Shinde__Devendra_Fadnavis.jpg',
        content: 'Recent political discussions in Maharashtra have been intense, sparked by the arrest of a man accused of sexually assaulting two kindergarten girls. The BJP credited Deputy Chief Minister Devendra Fadnavis for the police action, while the Shiv Sena pointed to Chief Minister Eknath Shinde’s involvement, leading to claims from politicians that both are trying to emulate the heroic “Singham” character from a popular movie. Meanwhile, in Kolkata, women from Sonagachi are celebrating their Durbar Durgotsab festival, emphasizing their resilience against violence in the wake of a tragic incident involving a doctor’s murder. Lastly, Karnataka’s IT Minister Priyank Kharge faced unexpected backlash from Assam after questioning why semiconductor projects were awarded to Gujarat and Assam, highlighting the political tensions within the region, especially since Kharge is the son of a prominent Congress leader. These events showcase ongoing social challenges and the dynamics of political rivalry in India.',
        url: 'https://economictimes.indiatimes.com/epaper/delhicapital/2024/oct/11/et-poli/political-leaders-compete-for-vigilante-image-amidst-child-assault-controversy/articleshow/114130818.cms',
        category: 'Politics',
        
      ),


      News(
        title: 'India loses its Ratan.',
        description: 'Ratan Tata, visionary industrialist, dies at 86; honored nationally.',
        imageUrl: 'https://images.moneycontrol.com/static-mcnews/2024/10/20241009184828_Ratan-Tata-2-TT.jpg',
        content: 'Ratan Tata’s evolution from a powerful industrialist to a beloved social media figure is a testament to his versatility and humility. While leading the Tata Group through transformative global acquisitions and internal restructuring, he also connected with a new generation through his personal, heartwarming Instagram posts, often sharing his love for dogs and reflecting on life. This softer side revealed a man who, despite his immense corporate achievements, faced loneliness and personal challenges. His journey showcases remarkable resilience, balancing the pressures of leading one of India’s largest conglomerates with an endearing ability to stay relatable and grounded in the eyes of the public.',
        url: 'https://economictimes.indiatimes.com/news/india/india-loses-its-ratan-bombay-house-wont-be-the-same-again/articleshow/114096879.cms',
        category: 'Top News',
        
      ),

       News(
        title: 'AAP Raises Concerns Over Voter Redistribution Plan.',
        description: 'AAP raises concerns over voter redistribution plan, proposes capping booths.',
        imageUrl: 'https://www.deccanchronicle.com/h-upload/2024/05/12/1089541-aa-2159448.webp',
        content: 'The Aam Aadmi Party (AAP) has expressed significant concerns to the Election Commission of India regarding a proposed plan to redistribute excess voters to less populated polling booths. AAP fears that this redistribution could create logistical challenges that may impact the smooth conduct of elections. The party argues that without careful consideration, such a plan might lead to confusion and delays at polling stations, undermining the voting experience for citizens. To address these concerns, AAP has suggested implementing a cap on the number of voters per booth, proposing a limit of 1,000 voters. This would help ensure that each polling booth can effectively manage the voter flow, reducing waiting times and making the process more efficient. Furthermore, AAP has emphasized the importance of keeping family members together when they go to vote. They believe that maintaining family units at the same polling booth can foster a sense of security and comfort for voters, particularly for those who may be less familiar with the voting process. If redistributing voters is deemed necessary, AAP recommends that additional booths be created to accommodate the increased number of voters while maintaining manageable booth sizes. This approach would not only alleviate the burden on existing booths but also enhance accessibility for voters, ensuring that everyone has the opportunity to exercise their democratic right without undue stress or complications. As the election process approaches, AAP’s proactive stance highlights the importance of thoughtful planning and responsiveness to voter needs in ensuring a fair and efficient electoral process.',
        url: 'https://economictimes.indiatimes.com/news/politics-and-nation/aap-writes-to-election-commission-over-voter-redistribution-plan-in-delhi/articleshow/114085625.cms',
        category: 'Politics',
        
      ),

      News(
        title: 'Owaisi: Omar Abdullah will be the weakest CM after NC-Congress win.',
        description: 'Owaisi claims Omar Abdullah will be the weakest Chief Minister.',
        imageUrl: 'https://www.hindustantimes.com/ht-img/img/2024/06/27/1600x900/Owaisi_1719507590209_1719507590463.jpg',
        content: 'Following the recent elections in Jammu and Kashmir, AIMIM chief Asaduddin Owaisi made a bold statement regarding Omar Abdullah’s potential leadership as Chief Minister. He asserted that Abdullah would be the “weakest Chief Minister” after the National Conference (NC) and Congress coalition emerged victorious in the elections. Owaisi’s remarks reflect a strong skepticism about Abdullah’s capacity to effectively govern the region, especially given the significant challenges it faces. The election results are crucial, as they indicate a shift in public sentiment, with the NC and Congress alliance securing a considerable number of seats. Owaisi believes that Abdullah may struggle to lead the coalition effectively, questioning his ability to unite the diverse factions within the alliance and create a cohesive agenda that addresses the pressing issues of governance, economic development, and security in Jammu and Kashmir. Abdullah’s previous tenure as Chief Minister was marked by various challenges, including controversies over governance and development initiatives, leading many to doubt his effectiveness in managing the state’s complex political landscape. Owaisi’s prediction raises concerns about Abdullah’s capacity to navigate these challenges and deliver meaningful solutions to the people of Jammu and Kashmir. As Abdullah prepares to take on this significant role again, it remains to be seen how he will respond to Owaisi’s criticisms and whether he can rise to the occasion, foster unity within the coalition, and address the urgent needs of the region. Ultimately, the effectiveness of his leadership will be judged by his ability to manage the complexities of governance in a politically sensitive and diverse state like Jammu and Kashmir.',
        url: 'https://economictimes.indiatimes.com/news/elections/assembly-elections/jammu-kashmir/omar-abdullah-will-be-the-weakest-chief-minister-aimim-chief-asaduddin-owaisi-reacts-after-nc-congress-victory-in-jammu-kashmir/articleshow/114088288.cms',
        category: 'Politics',
        
      ),


      News(
        title: 'India emerges as advanced supply hub: P&G.',
        description: 'India’s advanced supply chain boosts product availability and shopper needs.',
        imageUrl: 'https://images.moneycontrol.com/static-mcnews/2021/07/shutterstock_435218044.jpg?impolicy=website&width=1600&height=900',
        content: 'P&G India CEO, Kumar Venkatasubramanian, said that India is becoming an important place for highly advanced supply chains. This means that India is not only making products available more efficiently but is also adapting to meet changing customer needs. He explained that new digital technologies are helping to shape the future of supply chains by lowering costs, making data sharing smoother, predicting demand more accurately, reducing environmental impact, and providing better overall service. In simple terms, India is growing into a major hub for smarter and more efficient ways to move and manage products.',
        url: 'https://economictimes.indiatimes.com/industry/cons-products/fmcg/india-emerging-as-destination-for-most-evolved-supply-chain-capabilities-pg-india-ceo/articleshow/114019241.cms',
        category: 'Top News',
        
      ),
      News(
        title: 'Hezbollah’s Attacks on Israel Haifa & Tiberias.',
        description: 'The tensions remain high between the two, with the potential for further violence.',
        imageUrl: 'https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/28/full/1727493296-7325.jpg?im=FeatureCrop,size=(826,465)',
        content: 'On October 7, 2024, Hezbollah fired rockets at Haifa, a city in northern Israel, causing injuries and damage to buildings. In response, Israeli fighter jets launched airstrikes targeting Hezbollah’s intelligence and weapons facilities in Beirut and southern Lebanon. These airstrikes specifically aimed at command centers and weaponry stored in residential areas, leading to secondary explosions that further damaged nearby properties. The conflict resulted in both sides experiencing property damage and minor injuries among civilians. This escalation highlights the ongoing tensions between Israel and Hezbollah, making the situation in the region more volatile.',
        url: 'https://economictimes.indiatimes.com/news/defence/hezbollah-rockets-hit-israels-haifa-and-tiberias-10-injured/articleshow/113996849.cms',
        category: 'Politics',
      ),
      News(
        title: 'US military aid to Israel reaches 17.9 billion.',
        description: 'US military aid to Israel totals 17.9 billion since October.',
        imageUrl: 'https://static.timesofisrael.com/www/uploads/2023/09/AP23261849011633-e1695106688269.jpg',
        content: 'Since the Gaza war began on October 7, 2023, the United States has given at least 17.9 billion in military aid to Israel. This aid has provided essential military supplies, including munitions and missile defense systems, aimed at supporting Israel during ongoing conflicts. Additionally, the U.S. has spent another 4.86 billion to increase military operations in the region. This financial support reflects the U.S. commitment to Israel’s security but also raises concerns about the significant costs involved. Critics worry that these funds could impact domestic priorities and the humanitarian situation in Gaza. As tensions continue, the implications of such substantial military aid will be crucial in shaping future relations in the Middle East. For further details, you can check the article here.',
        url: 'https://economictimes.indiatimes.com/news/defence/us-spends-a-record-usd-17-9-billion-on-military-aid-to-israel-since-last-october-7/articleshow/114014242.cms',
        category: 'Politics',
      ),
      News(
        title: 'Israeli strike kills 10 firefighters.',
        description: 'Israeli airstrike in Lebanon kills 10 firefighters during emergency response.',
        imageUrl: 'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-04/230407-Maaliya-village-lebanon-israeli-airstrike-al-0650-9bedef.jpg',
        content: 'On October 7, 2024, an Israeli airstrike hit a municipal building in Baraachit, southern Lebanon, killing at least 10 firefighters who were responding to an emergency. This tragic event highlights the dangers faced by first responders in conflict areas. On the same day, Israel also observed the one-year anniversary of a deadly Hamas attack, leading to somber ceremonies across the country. The ongoing conflict has resulted in significant casualties and the displacement of many people in both Israel and Lebanon. Families are suffering from loss and destruction, and the humanitarian crisis continues to grow. As tensions rise, fears of more violence and retaliation persist. International efforts to achieve peace face many obstacles, with both sides firmly entrenched in their positions. The loss of the firefighters serves as a reminder of the human cost of war and the urgent need for dialogue and resolution to end the cycle of violence. Without meaningful action, more lives remain at risk, and the situation in the region could deteriorate further.',
        url: 'https://economictimes.indiatimes.com/news/defence/lebanon-says-an-israeli-strike-killed-10-firefighters-in-the-countrys-south/articleshow/114014236.cms',
        category: 'Politics',
      ),

      News(
        title: 'NSE share price rises 45%. Will growth continue?',
        description: 'NSE’s IPO buzz boosts share price by 35%, attracting investors.',
        imageUrl: 'https://bsmedia.business-standard.com/_media/bs/img/article/2023-07/20/full/1689824384-5135.jpg',
        content: 'In recent months, the National Stock Exchange (NSE) of India has seen a significant increase in interest regarding its upcoming initial public offering (IPO). Over the past 3-4 months, this excitement has led to a 35% rise in its share price in the unlisted market. Investors are enthusiastic about the potential growth of the NSE and are eagerly awaiting its official listing. Many believe the stock will trade at a higher premium compared to its current market price, reflecting optimism about the NSE’s future performance. The anticipation surrounding the IPO indicates that investors see this as a promising investment opportunity. As the listing date approaches, more investors are closely monitoring the situation, curious to see how the market will react once the shares become available for public trading. This growing interest underscores a broader confidence in the NSE’s ability to perform well after going public. The higher expected share price compared to its current value suggests that many believe there is significant potential for growth. In summary, the buzz around the NSE’s IPO is significant, and investors are hopeful that the upward trend in share price will continue, as they await further developments in this exciting opportunity. The positive sentiment around the NSE is a clear indicator of investor confidence, making it a topic of keen interest in the financial market. Overall, the NSE’s upcoming IPO is generating considerable excitement, and many are looking forward to the opportunities it may bring.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/nse-share-price-jumps-up-to-45-in-3-4-months-on-ipo-buzz-will-the-uptrend-continue/articleshow/114015488.cms',
        category: 'Markets',
      ),

      News(
        title: 'Jammu Kashmir 2024 Elections Update.',
        description: 'Jammu Kashmir elections set for October 2024 with key candidates.',
        imageUrl: 'https://i2.wp.com/images.tv9hindi.com/wp-content/uploads/2024/08/jk-election-omar-mufti-raina.jpeg?ssl=1',
        content: 'The Jammu and Kashmir assembly elections are scheduled for October 2024, with significant political activities underway as various parties prepare for the polls. The main parties in the running include the National Conference (NC), People’s Democratic Party (PDP), Indian National Congress, and several smaller parties. The NC has announced that Omar Abdullah will contest from Ganderbal, while the Congress party has fielded candidates like Ghulam Ahmad Mir from Dooru. The PDP, although part of the INDI alliance, has released its own list of candidates, with Mehbooba Mufti’s daughter Iltija making her debut in Bijbehara. In this election, the NC aims to restore Article 370 and statehood, while the Congress is focusing on statehood restoration and development. The PDP, under Mehbooba Mufti, has also emphasized similar goals but has distanced itself from alliances with the BJP. Smaller parties like the Jammu and Kashmir People’s Conference and the Democratic Progressive Azad Party are also contesting, along with independent candidates. The election is crucial for addressing ongoing issues in the region and restoring political stability following the revocation of Jammu and Kashmir’s special status in 2019  '
        ,
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/nse-share-price-jumps-up-to-45-in-3-4-months-on-ipo-buzz-will-the-uptrend-continue/articleshow/114015488.cms',
        category: 'Politics',
      ),

      News(
        title: 'Aaditya Thackeray Criticizes Government.',
        description: 'Thackeray accuses Shinde government of favoring Adani Group projects.',
        imageUrl: 'https://i.ytimg.com/vi/6jphm7N2oK8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAPNMJmv1sGdPsBECtdwKIvWUwFEA',
        content: 'Aaditya Thackeray, a leader of the Shiv Sena (UBT), has publicly accused the Eknath Shinde government of favoring the Adani Group in the Dharavi redevelopment project. He claims that the government has granted a significant premium of ₹5,000 crore to the Adani-led Special Purpose Vehicle (SPV) instead of benefiting Mumbai’s civic body, the Brihanmumbai Municipal Corporation (BMC). Thackeray is demanding an explanation from the BMC regarding this arrangement, expressing concerns over how this decision affects the local residents. He criticized the government for displacing many residents due to redevelopment efforts, arguing that their needs are being overlooked in favor of corporate interests. Thackeray highlighted the importance of prioritizing the welfare of the people of Dharavi, which is one of the largest slums in Asia and home to a diverse community. He emphasized that any redevelopment plan should be transparent and inclusive, ensuring that the existing residents are not displaced without proper resettlement options. Moreover, he vowed that if the Maha Vikas Aghadi (MVA) coalition, which includes his party, returns to power, they will make necessary changes to ensure that the rights and needs of the residents are respected. Thackeray’s statements reflect ongoing tensions in Mumbai’s political landscape, particularly regarding development projects that impact marginalized communities. His criticism of the Shinde government highlights the broader concerns over corporate influence in public projects and the need for accountability in governance. This situation illustrates the complex dynamics of politics, development, and community rights in urban settings like Dharavi',
        url: 'https://economictimes.indiatimes.com/news/politics-and-nation/dharavi-redevelopment-clause-gives-rs-5k-crore-premium-to-adani-led-spv-and-not-bmc-aaditya/articleshow/114017741.cms',
        category: 'Politics',
      ),

      News(
        title: 'Stock Reports Plus Overview.',
        description: ' Comprehensive report evaluates 4,000+ stocks on key components.',
        imageUrl: 'https://cdn.corporatefinanceinstitute.com/assets/income-investing-1024x576.jpeg',
        content: 'Stock Reports Plus, powered by Refinitiv, is a detailed research report that analyzes over 4,000 publicly listed stocks. It evaluates five important components: earnings, fundamentals, relative valuation, risk, and price momentum. Each of these elements contributes to understanding a stock’s performance and potential. After evaluating these components, the report generates standardized scores for each stock. These scores help investors compare different stocks easily. The scores are calculated using the simple average of the ratings from the five components, which are then normally distributed to derive an average score. This approach ensures a fair assessment, making it easier for investors to make informed decisions based on consistent and reliable data. By providing insights into the strengths and weaknesses of various stocks, Stock Reports Plus aims to enhance the investment decision-making process for both individual and institutional investors. Overall, this comprehensive report serves as a valuable tool for those looking to navigate the complex world of stock market investments effectively.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/top-nifty50-stocks-analysts-suggest-buying-in-this-volatile-week/articleshow/114001935.cms',
        category: 'Investment',
      ),

      News(
        title: 'Market Conditions Worsen Significantly.',
        description: 'Market breadth is negative, caution needed for investments.',
        imageUrl: 'https://www.livemint.com/lm-img/img/2024/09/10/1600x900/Stock_market_today_Buy_or_sell_Stocks_to_buy_today_1725939763600_1725939763883.jpg',
        content: 'The current market situation shows more than just a decline in major indices like Nifty and Sensex; what’s concerning is the overall negative market breadth across various segments. This means that a lot of stocks are falling, indicating widespread weakness in the market. If this pressure continues, there’s a significant risk of the situation worsening further. Currently, stock valuations are on the higher side, which means that even if the market begins to recover, it could take time for things to improve. With the Q2 earnings season approaching, investors may react strongly to any disappointing earnings reports. Therefore, it’s crucial to be careful and selective when investing new money. Investors should look at stocks with a strong upward trajectory based on five key factors: earnings, fundamentals, relative valuation, risk, and price momentum. These factors help gauge the overall health and potential growth of stocks. Stocks that show improvement in these areas may present better opportunities. However, given the current market conditions, one should proceed with caution. It’s important to analyze each investment carefully, as the market environment is uncertain and volatile right now. Overall, while some stocks may show promise, the general advice is to be selective and informed in this challenging landscape.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/top-nifty50-stocks-analysts-suggest-buying-in-this-volatile-week/articleshow/114001935.cms',
        category: 'Investment',
      ),


      News(
        title: 'Stock Market Correction Insights.',
        description: 'Large-cap stocks lead correction; don’t panic, assess fundamentals.',
        imageUrl: 'https://barchart-news-media-prod.aws.barchart.com/FC/f27de13bdbdf3c92db33a946873b0394/%3Furl%3Dhttps%253a%252f%252fg.foolcdn.com%252feditorial%252fimages%252f718807%252fgrowth-stock-chart.jpg%26amp%3Bw%3D700',
        content: 'After a long time, stock prices and market indices have sharply corrected, marking a significant downturn across the board since March 2024. Typically, the first phase of such corrections is led by large-cap stocks, which are often seen as stable investments. This trend is consistent with past corrections, and investors should note that large-cap stocks also tend to recover first when the market revives. Before making any buying or selling decisions in the current market, it is crucial to evaluate whether the sector in which the company operates has faced issues recently. If a sector is stable, it’s important to separate market volatility from business performance. Markets frequently experience volatility, so long-term investment decisions shouldn’t be based solely on the weekly or monthly fluctuations of indices like the Nifty or Sensex. Instead, investors should focus on the underlying fundamentals of the companies they are interested in. If there hasn’t been a significant negative change in a company’s fundamentals, there is no need to panic. The market may go through ups and downs, but staying informed and grounded in a company’s actual performance will lead to better investment decisions. In summary, while corrections can be alarming, taking a measured approach and focusing on fundamental strengths can provide a clearer path forward for investors navigating these challenging market conditions.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/why-predict-time-and-magnitude-of-correction-focus-on-business-and-diversification-6-large-cap-stocks-with-upside-potential-of-up-to-38/articleshow/113977126.cms',
        category: 'Investment',
      ),

      News(
        title: 'Festive Season Jewelry Trends.',
        description: 'Jewelry ads dominate; Titan faces new competitors this season.',
        imageUrl: 'https://paytmblogcdn.paytm.com/wp-content/uploads/2023/09/Blog_Paytm_Gold-Rates-Historical-Data-for-India.jpg',
        content: 'During the festive season, it’s common to see front-page advertisements in newspapers featuring jewelry brands, premium real estate projects, or upcoming IPOs. While jewelry ads have long been a staple of festive marketing, brands like Titan Company have typically led the way in advertising. However, this year, several other jewelry brands are transitioning from being regional players to gaining national prominence. This shift raises an important question: should consumers and investors look beyond Titan? The answer may lie in the festive season sales results. These sales will indicate whether Titan can maintain its dominance or if the emerging brands can capture market share. As competition increases, customers might be drawn to new brands offering unique designs, better pricing, or innovative marketing strategies. The festive season presents a crucial opportunity for these brands to showcase their strengths and appeal to a wider audience. Therefore, consumers should remain vigilant and consider exploring options beyond Titan, as these emerging brands may provide exciting alternatives. Ultimately, the festive sales figures will shed light on the changing landscape of the jewelry market, revealing whether Titan’s reign continues or if new players will emerge as serious competitors. As the season unfolds, it will be interesting to see how consumer preferences evolve and how various brands adapt to the competition. The dynamic nature of the jewelry market suggests that while Titan has historically been a leader, the rise of other brands may reshape the market in significant ways.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/this-festive-season-is-the-street-finally-looking-beyond-titan-4-jewellery-stocks-with-an-upside-potential-of-up-to-22/articleshow/113934568.cms',
        category: 'Investment',
      ),

      News(
        title: 'Congress Spends on Elections.',
        description: 'Congress allocates Rs 585 crore for Lok Sabha and state elections.',
        imageUrl: 'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-75598,resizemode-75,msid-114021036/news/politics-and-nation/congress-spent-rs-585-crore-on-2024-lok-sabha-election-4-state-assembly-polls.jpg',
        content: 'The Congress Party has reported spending approximately Rs 585 crore on the 2024 Lok Sabha and state assembly elections. This substantial expenditure included Rs 410 crore dedicated to advertisements, highlighting the importance of media outreach in their campaign. Additionally, Rs 46 crore was spent on virtual campaigns, reflecting a shift towards digital platforms in modern election strategies. Air travel for star campaigners accounted for another Rs 105 crore, emphasizing the need for prominent figures to mobilize support across various regions. Despite facing initial concerns about a cash crunch, the party successfully secured significant funding for its campaign efforts. This financial commitment demonstrates Congress’s determination to make a strong impact in the upcoming elections, leveraging various channels to reach voters effectively. The large amount spent also indicates the competitive nature of the election landscape, where parties must invest heavily to gain visibility and support. With such a substantial budget, Congress aims to enhance its outreach and engagement with the electorate, ensuring its message resonates across diverse demographics. As the elections approach, how effectively the party utilizes this funding will play a crucial role in its overall performance at the polls. Overall, the Congress Party’s financial strategy highlights its focus on robust campaigning, which may influence voter perceptions and ultimately the election outcomes. In the context of India’s vibrant democracy, this spending is a testament to the significance of well-funded campaigns in shaping political narratives and influencing public opinion. How this translates into electoral success remains to be seen, but the commitment to substantial financial investment reflects the high stakes involved in the political arena.',
        url: 'https://economictimes.indiatimes.com/news/politics-and-nation/congress-spent-rs-585-crore-on-2024-lok-sabha-election-4-state-assembly-polls/articleshow/114021036.cms',
        category: 'Politics',
       ),
      
      News(
        title: 'Haryana Election Results Awaited.',
        description: 'Exit polls favor Congress, but BJP seeks third term.',
        imageUrl: 'https://www.financialexpress.com/wp-content/uploads/2024/10/Haryana-list-of-constituencies.jpg',
        content: 'The 2024 Haryana legislative assembly elections have generated significant interest as the state awaits the results of its 15th assembly election. Exit polls currently favor the Congress Party, suggesting they might gain a strong position. However, the Bharatiya Janata Party (BJP) is optimistic about securing a third consecutive term in power. This election is particularly notable for several key contests that could shape the future of Haryana’s politics. In Julana, the focus is on wrestler candidates, showcasing a unique blend of sports and politics that could attract voters. Meanwhile, Sohna has strong independent candidates vying for attention, indicating a potential shift in traditional party dynamics. The Ladwa constituency is under special scrutiny, as it is directly linked to the Chief Minister’s seat, making it a critical area for both major parties. The outcomes of these contests will not only determine the political landscape in Haryana but could also influence future alliances and strategies in the region. Voter sentiments are likely to play a crucial role in these elections, as residents reflect on the performance of the current government and the promises made by various parties. As the counting day approaches, the excitement and anxiety among supporters and candidates alike are palpable. The results could lead to significant changes in governance and policy direction, depending on which party emerges victorious. Overall, the 2024 Haryana elections are set to be a pivotal moment for the state’s political trajectory, with implications that extend beyond local governance to national politics. The final results will be eagerly awaited by both political analysts and the electorate, as they hold the potential to redefine party strength and influence in Haryana.',
        url: 'https://economictimes.indiatimes.com/news/elections/assembly-elections/haryana/haryana-assembly-elections-2024-julana-ladwa-garhi-uchana-kalan-and-6-other-key-seats-that-could-decide-states-fate/articleshow/114010393.cms',
        category: 'Politics',
       ),


       News(
        title: 'Kejriwal Stands Firm Amid Raids.',
        description: 'AAP leader defends party against ED’s corruption investigation.',
        imageUrl: 'https://img.republicworld.com/all_images/arvind-kejriwals-big-statement-promises-to-campaign-for-pm-modi-if-this-demand-is-met-1728211366889-16_9.webp',
        content: 'AAP leader Arvind Kejriwal has expressed unwavering support for his party amidst ongoing investigations by the Enforcement Directorate (ED), particularly concerning Rajya Sabha MP Sanjeev Arora, who is involved in a money laundering case. In a recent press conference, Kejriwal confidently stated, “God is with the Aam Aadmi Party,” encouraging party members to remain fearless during these turbulent times. He accused the BJP-led central government of using investigative agencies as tools to target and intimidate his party under the pretext of corruption probes. Kejriwal’s remarks highlight the intense political rivalry in India, where allegations of corruption often intersect with party politics. The AAP leader’s assertion suggests that he believes these investigations are politically motivated rather than genuinely aimed at addressing wrongdoing. He urged party members to continue their work for the public and not let fear hinder their commitment to serving the people of Delhi and beyond. This incident underscores the larger issue of political pressure and the role of government agencies in elections and governance. As the investigation unfolds, it raises questions about the use of power and the implications for political parties in India, especially those challenging the ruling government. Kejriwal’s stance reflects a broader narrative of resilience against perceived government overreach, with his party portraying itself as a victim of political machinations. The outcome of these investigations could significantly impact the AAP’s image and its electoral prospects. As the situation develops, it remains crucial for party members and supporters to stay informed and engaged. The political landscape in India continues to evolve, and events like these shape public perception and party dynamics. The upcoming days will be essential in determining the impact of these raids on the AAP and its future in Indian politics.',
        url: 'https://economictimes.indiatimes.com/news/politics-and-nation/god-with-aap-no-need-to-be-scared-kejriwal-after-ed-raids-on-party-mp/articleshow/114006210.cms',
        category: 'Politics',
       ),


       News(
        title: 'Congress Critiques Census Delay.',
        description: 'Congress demands caste count for social justice, blames Modi.',
        imageUrl: 'https://vietnamtimes.org.vn/stores/news_dataimages/honganhvnt/092021/22/13/in_article/2344_ram-nath-kovind-0.jpg?rt=20210922132350',
        content: 'The Congress Party has criticized Prime Minister Narendra Modi for delaying the Census, stating that a caste count is essential for achieving social, economic, and political justice in areas like education and employment. They argue that the absence of this caste data prevents over 10 crore Indians from accessing necessary benefits, as the current Census data is based on 2011 figures, which are outdated. This delay affects various policies and programs aimed at helping marginalized communities, making it difficult to identify who needs assistance most. The Congress Party believes that having an accurate and current Census is vital for making informed decisions about resource allocation and development strategies. By focusing on caste counts, they assert that the government can better understand the needs of diverse communities, which would ultimately lead to more equitable opportunities in education and jobs. The Congress’s emphasis on the importance of this count reflects their broader agenda of advocating for the rights of underrepresented groups. They accuse the Modi administration of being indifferent to the pressing issues faced by these communities and stress that timely action on the Census is crucial for social upliftment. Furthermore, Congress calls on the government to prioritize the Census process and ensure that it reflects the realities of India’s diverse population. The party suggests that without this critical data, any efforts toward inclusive governance will fall short. As discussions around the Census continue, the spotlight remains on the government’s commitment to addressing the needs of all citizens, particularly those from marginalized backgrounds. The outcome of this situation could have lasting implications for India’s social fabric and its approach to justice and equality. Thus, the Congress Party urges the Prime Minister to take immediate action to conduct the Census, including the necessary caste count.',
        url: 'https://economictimes.indiatimes.com/news/politics-and-nation/why-is-pm-modi-delaying-census-that-must-include-caste-count-congress/articleshow/114000662.cms',
        category: 'Politics',
       ),


       News(
        title: 'Reliance Board Meeting Scheduled.',
        description: 'Reliance Industries reviews quarterly financial results on October 14.',
        imageUrl: 'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/NOBQHWJMMNO3TMPOX2KAHFTVIA.jpg',
        content: 'Reliance Industries Ltd (RIL) is set to hold a board meeting on October 14 to discuss and review its financial results for the quarter ending September 2024. This meeting comes after the company reported a 5% decline in net profit for the first quarter of June 2024. Investors and analysts will be particularly interested in the company’s performance in this latest quarter, especially considering the previous decline. Following the meeting, RIL will present the financial results to analysts and the media, providing insights into its operations, revenue generation, and strategic plans moving forward. These discussions are crucial as they reflect the company’s financial health and outlook amidst the current market conditions. Investors will be keen to see if Reliance has taken any steps to address the decline in profit and whether it has implemented new strategies that could positively impact its financial performance. The insights shared during this presentation will likely influence market perceptions of RIL’s stock and its future growth potential. With a diverse portfolio in sectors like telecommunications, retail, and petrochemicals, Reliance’s results are closely watched by stakeholders. As the meeting approaches, market participants will be looking for any signals regarding the company’s performance trends, investment plans, and responses to challenges in the business environment. The outcomes of this meeting will not only inform shareholders but also set the tone for RIL’s strategic direction in the coming months. Therefore, the financial results are highly anticipated and could significantly impact investor confidence in Reliance Industries. For more information on this topic, you can visit the Economic Times article.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/reliance-industries-to-declare-q2-results-on-october-14/articleshow/114021026.cms',
        category: 'Markets',
       ),


       News(
        title: 'Same-Day Sale Proceeds.',
        description: 'Investors can now access full sale proceeds immediately.',
        imageUrl: 'https://images.moneycontrol.com/static-mcnews/2024/04/20240430142738_bse_nse_stockmarket_nifty_sensex.jpg?impolicy=website&width=1600&height=900',
        content: 'Starting Monday, investors will be able to access 100% of their sale proceeds on the same day, a significant change from the previous system where only 80% was available immediately, with the remaining 20% released later. This adjustment is designed to enhance liquidity in the market, allowing investors to reinvest their funds right away instead of waiting for a portion of their proceeds. The change is expected to greatly benefit trading activities, encouraging more active participation from investors. By having immediate access to all their funds, investors can quickly react to market opportunities and make timely investment decisions. This could lead to increased trading volumes as investors feel more empowered to engage in buying and selling without delays. The shift not only improves investor confidence but also aligns with the goal of creating a more efficient market. Overall, this change is anticipated to facilitate smoother trading operations and foster a more dynamic trading environment, which can be beneficial for both investors and the overall market ecosystem. Market analysts will be closely monitoring the impact of this policy on trading behaviors and market dynamics in the coming weeks. For further details, you can read the full article here.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/investors-can-now-access-100-of-sale-proceeds-for-same-day-trading/articleshow/114020922.cms',
        category: 'Markets',
       ),


       News(
        title: 'Indian Indices Lose Streak.',
        description: 'Indices decline for sixth session amid corporate and global tensions  ',
        imageUrl: 'https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/28/full/1727493296-7325.jpg?im=FeatureCrop,size=(826,465)',
        content: 'On October 7, 2024, Hezbollah fired rockets at Haifa, a city in northern Israel, causing injuries and damage to buildings. In response, Israeli fighter jets launched airstrikes targeting Hezbollah’s intelligence and weapons facilities in Beirut and southern Lebanon. These airstrikes specifically aimed at command centers and weaponry stored in residential areas, leading to secondary explosions that further damaged nearby properties. The conflict resulted in both sides experiencing property damage and minor injuries among civilians. This escalation highlights the ongoing tensions between Israel and Hezbollah, making the situation in the region more volatile.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/hdfc-bank-divests-100-stake-in-hdfc-edu-for-rs-192-crore/articleshow/114017864.cms',
        category: 'Markets',
       ),


       News(
        title: 'HDFC Bank Sells Education Subsidiary.',
        description: 'HDFC Bank sells full stake in education subsidiary for ₹192 crore.',
        imageUrl: 'https://assets.upstox.com/content/assets/images/cms/2024419/1662092049.jpg',
        content: 'HDFC Bank, the largest private sector lender in India, announced that its board has approved the complete sale of its subsidiary, HDFC Education, to Vama Sundari Investments. This all-cash deal amounts to ₹192 crore, translating to a sale price of ₹9.60 per share. The decision reflects the bank’s strategy to streamline its operations and focus on its core banking activities. By divesting its education subsidiary, HDFC Bank aims to enhance its financial position while allowing the new investor to potentially expand the subsidiary’s reach and impact in the education sector.',
        url: 'https://economictimes.indiatimes.com/markets/stocks/news/hdfc-bank-divests-100-stake-in-hdfc-edu-for-rs-192-crore/articleshow/114017864.cms',
        category: 'Markets',
       ),


       News(
        title: 'Indian Navy Strengthens Cooperation.',
        description: 'Indian Navy ships enhance ties with Iran through training.',
        imageUrl: 'https://i.ytimg.com/vi/PJrg5bFlwKI/maxresdefault.jpg',
        content: 'Recently, three Indian Navy ships docked at Bandar Abbas, Iran, for a training deployment in the Persian Gulf. This visit is significant as it aims to bolster maritime cooperation between India and Iran. During their stay, the ships were given a warm ceremonial welcome, emphasizing the importance of this partnership. The deployment includes various professional exchanges and exercises designed to enhance maritime security and interoperability between the two nations.By engaging in joint activities, both countries hope to address regional maritime challenges effectively. This collaboration reflects India’s commitment to maintaining peace and stability in the Persian Gulf region. Furthermore, it demonstrates India’s willingness to work closely with Iran, fostering mutual understanding and strengthening ties in defense matters. The training deployment could lead to future collaborations and initiatives that promote maritime security and counteract potential threats in the area. Overall, this strategic move by the Indian Navy is part of a broader effort to enhance international cooperation and ensure safer maritime operations in a region that is increasingly vital to global trade and security.',
        url: 'https://economictimes.indiatimes.com/news/defence/india-docks-naval-warships-at-iran-port-as-war-escalates-is-this-a-strategic-response-to-the-middle-east-strife/articleshow/113891000.cms',
        category: 'Top News',
       ),

       News(
        title: 'Gandhi’s Image on Currency.',
        description: 'Gandhi’s presence on money symbolizes India’s historical journey.',
        imageUrl: 'https://images.news18.com/ibnlive/uploads/2023/10/white-background-11-2023-10-6857dad409ff145c1539e3673b1da252-3x2.jpg',
        content: 'The presence of Mahatma Gandhi’s face on Indian currency is now seen as a natural choice, but it was not always part of the plan. Initially, the Indian currency featured the image of the British monarch. However, as India moved towards independence and established its identity, the need for national symbols became crucial.Gandhi, as a leader of the freedom struggle, embodied the ideals of non-violence, unity, and justice, making him a perfect representative for the nation. The decision to feature his image was part of a broader effort to reflect India’s values and aspirations. This transition from colonial symbols to figures of national importance marked a significant shift in the country’s identity.The use of Gandhi’s image on currency serves not only as a reminder of India’s struggle for independence but also reinforces his principles in contemporary society. It connects the past with the present, encouraging citizens to remember the ideals that shaped their nation. By placing Gandhi on the currency, the government emphasizes the importance of his contributions to the nation and inspires future generations to uphold these values.Overall, Gandhi’s presence on Indian money is a powerful symbol of national pride, unity, and the ongoing journey towards fulfilling the dreams of the freedom struggle.',
        url: 'https://economictimes.indiatimes.com/news/india/mahatma-gandhi-wasnt-the-first-choice-for-currency-notes/articleshow/113866527.cms',
        category: 'Top News',
       ),
      
      News(
        title: 'Court Orders Autopsy Procedures.',
        description: 'Court mandates specific autopsy conditions for rape-murder case.',
        imageUrl: 'https://img.etimg.com/thumb/width-1200,height-1200,imgsize-140440,resizemode-75,msid-113993306/news/india/west-bengal-minors-murder-hc-orders-autopsy-at-aiims.jpg',
        content: 'The Calcutta High Court has ordered that a post-mortem examination be conducted at AIIMS Hospital in Kalyani for a minor who was allegedly raped and murdered in South 24 Parganas. This decision underscores the seriousness of the case and the need for a thorough investigation. The court has specified that the autopsy should involve an expert from AIIMS to ensure its credibility and accuracy.Additionally, the process must be videographed, allowing for a detailed record of the findings. This measure aims to maintain transparency and accountability in the investigation, providing clear evidence of the autopsy procedure and its results. The victim’s parents will also be allowed to attend the examination virtually, which is crucial for them to be involved in the process while ensuring their emotional well-being.Furthermore, a judicial magistrate from Baruipur is required to be present during the autopsy. This presence adds an extra layer of oversight, ensuring that all legal protocols are followed and that the rights of the victim and their family are protected throughout the investigation.This case has drawn significant attention, highlighting the ongoing issues of child safety and gender-based violence in society. The court’s orders aim to ensure that justice is served and that the investigation is conducted with the utmost care and professionalism. It reflects the judiciary’s commitment to upholding the rule of law and protecting the rights of victims in sensitive cases like this one.',
        url: 'https://economictimes.indiatimes.com/news/india/mahatma-gandhi-wasnt-the-first-choice-for-currency-notes/articleshow/113866527.cms',
        category: 'Top News',
       ),

       News(
        title: 'Assam Boosts Border Security.',
        description: 'Increased patrols tackle illegal Bangladeshi immigration effectively.',
        imageUrl: 'https://m.economictimes.com/thumb/msid-111868434,width-1600,height-900,resizemode-4,imgsize-305958/bangladesh-protest-.jpg',
        content: 'Assam’s security forces are intensifying their patrols along the Indo-Bangladesh border to address the issue of illegal immigration. Since January, they have apprehended and pushed back 54 illegal Bangladeshi immigrants. This move aims to bolster national security and control the influx of migrants, particularly in light of unrest in Bangladesh, which has raised concerns about a potential increase in immigration. To enhance surveillance and ensure effective repatriation, the state government is recording biometric data and identification documents of suspected immigrants. This approach allows authorities to maintain accurate records and monitor individuals who may attempt to cross the border illegally. By implementing these measures, Assam aims to create a robust system for tracking illegal immigrants and facilitating their return to their home country. The biometric data collection is part of a larger strategy to improve immigration management and border security. This data helps in identifying individuals and ensures that those without valid documents can be efficiently processed for repatriation. Moreover, the increased patrols and systematic recording are crucial in deterring future attempts at illegal crossings. Overall, Assam’s proactive stance in enhancing border security demonstrates the government’s commitment to maintaining law and order while addressing humanitarian concerns regarding immigration. The situation remains dynamic, and the government is continuously adapting its strategies to effectively manage border security and immigration challenges. This vigilant approach aims to create a safer environment for residents and uphold the integrity of national borders.',
        url: 'https://economictimes.indiatimes.com/news/india/contrary-to-anticipation-bangladesh-unrest-fuels-influx-of-muslims-into-india/articleshow/114020727.cms',
        category: 'Top News',
       ),

       News(
        title: 'Bihar’s New Tiger Reserve',
        description: 'Kaimur Wildlife Sanctuary designated as second tiger reserve.',
        imageUrl: 'https://www.holidify.com/images/cmsuploads/compressed/Tiger_20180430213349.jpg',
        content: 'Bihar is set to establish Kaimur Wildlife Sanctuary as its second tiger reserve, following the approval from the National Tiger Conservation Authority. This decision comes as the Valmiki Tiger Reserve has reached its capacity for tigers. The Kaimur Wildlife Sanctuary will provide a new habitat for the growing tiger population in the state, which has been thriving in recent years. In addition to tigers, the Kaimur Wildlife Sanctuary is home to various other wildlife species, including leopards, sloth bears, and numerous bird species. By designating this area as a tiger reserve, the state government aims to enhance conservation efforts and ensure the protection of these majestic animals and their habitats. The establishment of this reserve is crucial for maintaining ecological balance and promoting biodiversity in the region. It also highlights Bihar’s commitment to wildlife conservation, recognizing the importance of protecting natural habitats. As tigers are a key species in the ecosystem, their preservation can have positive effects on the entire environment. Overall, the development of Kaimur Wildlife Sanctuary as a tiger reserve reflects the growing awareness and dedication to wildlife protection in Bihar. This initiative is expected to create new opportunities for eco-tourism, which can benefit local communities and contribute to the economy while fostering a deeper appreciation for nature and wildlife conservation efforts.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),

        News(
        title: 'Kerala Faces Flooding Again.',
        description: 'Heavy rains cause floods in Wayanad after recent landslides.',
        imageUrl: 'https://static.toiimg.com/thumb/resizemode-4,width-1280,height-720,msid-112144791/112144791.jpg',
        content: 'Kerala’s Wayanad district has experienced heavy rainfall, leading to a flood-like situation. This comes shortly after the area faced devastating landslides in July, which resulted in the tragic loss of over 200 lives. The Indian Meteorological Department (IMD) has issued yellow alerts for several districts, including Thiruvananthapuram and Wayanad, warning residents of possible severe weather. Along with the rainfall, thunderstorms and gusty winds are expected in various regions, raising concerns for further landslides and flooding. Authorities are on high alert to monitor the situation and provide assistance to affected communities. The heavy rainfall has compounded the challenges for residents still recovering from the previous disaster. The government is coordinating with disaster response teams to ensure safety measures are in place and to provide timely support to those in need. Local officials are urging people to remain cautious, avoid unnecessary travel, and stay informed through official channels. The situation highlights the vulnerability of the region to extreme weather events, emphasizing the importance of preparedness and disaster management strategies. As the state deals with these natural challenges, the focus will be on safeguarding lives and minimizing damage to property and infrastructure. Residents are encouraged to take precautions and heed advisories from local authorities during this critical time.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),

       News(
        title: 'Mumbai Skill Development Centre.',
        description: 'New centre aims to train one lakh skilled individuals.',
        imageUrl: 'https://m.economictimes.com/thumb/msid-114019217,width-1200,height-900,resizemode-4,imgsize-146222/new-delhi-jul-10-ani-union-commerce-and-industry-minister-piyush-goyal-addre-.jpg',
        content: 'Union Minister Piyush Goyal has announced the establishment of a Skill Development Centre in Mumbai, located in Borivali, to tackle the shortage of skilled workers in the region. The goal is to train 100,000 individuals to become job-ready, enhancing their employability in various sectors. The centre will be developed with support from the Confederation of Indian Industry (CII) and will operate under a public-private partnership (PPP) model. Set to become operational in the next six to eight months, the initiative aims to bridge the skills gap that many industries currently face. By equipping young people with essential skills, the centre will not only benefit the individuals trained but also help local businesses find qualified workers. This move is crucial, especially in a time when the demand for skilled labor is rising due to the growing economy. The Skill Development Centre will offer various training programs tailored to the needs of the job market, focusing on areas that are in high demand. This initiative reflects the government’s commitment to fostering skill development and ensuring that the workforce is prepared for the challenges of the modern job landscape. With its potential impact on employment and economic growth, this centre is a significant step towards creating a skilled and competitive workforce in Mumbai. The focus on skill development is expected to empower many individuals and contribute positively to the local economy.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),

       News(
        title: 'Special Trains for Festivals.',
        description: 'India’s Railways introduces 6,556 trains for festive travel.',
        imageUrl: 'https://www.impressivetimes.com/wp-content/uploads/2024/09/WhatsApp-Image-2024-09-29-at-5.08.33-PM-e1727612515189.jpeg',
        content: 'To accommodate the increased travel demand during the festive season, India’s Railways will operate 6,556 special trains from October 1 to November 30. This initiative aims to facilitate travel for major festivals like Durga Puja, Diwali, and Chhath Puja. In addition to the special trains, the Railways will also add 12,500 extra coaches to ensure passengers have more seating options, particularly during the busy periods of Diwali and Chhath Puja. Among these special trains, the Central Railways has announced 278 specifically designated trains to enhance comfort and accessibility for travelers. The decision to run additional trains and coaches reflects the Railways’ commitment to providing efficient and timely transportation options for the millions of people traveling during this festive time. With these arrangements, the Railways hopes to minimize overcrowding and ensure a smoother travel experience for everyone. The festive season in India often sees a significant rise in passenger numbers, as families travel to celebrate together. By taking proactive measures to increase capacity, the Railways aims to meet this demand effectively. Passengers can book their tickets in advance to secure their travel plans. This initiative not only supports the joyous celebrations but also boosts the economy by facilitating travel across the country during this vibrant time of year. Overall, these special trains are a vital step in ensuring that people can travel safely and comfortably to their destinations for the festivities.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),

       News(
        title: 'NEET-UG Exam Paper Scandal.',
        description: 'CBI uncovers NEET-UG exam paper leak involving 144 candidates.',

        imageUrl: 'https://img.etimg.com/thumb/width-1200,height-900,imgsize-43094,resizemode-75,msid-114018702/news/india/cbi-identifies-144-candidates-in-neet-ug-exam-paper-leak-49-arrested-in-ongoing-investigation.jpg',
        content: 'The Central Bureau of Investigation (CBI) has revealed a significant scandal involving the National Eligibility cum Entrance Test for Undergraduates (NEET-UG). They found that 144 candidates had paid for access to leaked exam papers. Allegations point to Pankaj Kumar and several school officials in Hazaribagh, who reportedly stole the papers and shared them with students for a fee. As a result of this investigation, the CBI has arrested 49 individuals and filed charges against 40. The candidates who paid for the leaked papers received scanned and solved versions of the exam questions in advance, giving them an unfair advantage in the highly competitive entrance exam. This unethical practice undermines the integrity of the educational system and poses serious concerns about fairness in academic assessments. The CBI is currently taking legal actions against those involved in this operation, aiming to address the issue and restore trust in the examination process. The examination for medical colleges is crucial for aspiring medical students, and such incidents can greatly affect the careers of genuine candidates. The CBI’s actions emphasize the need for strict measures against examination fraud to ensure a level playing field for all candidates. Moving forward, stricter protocols and safeguards will likely be put in place to prevent similar occurrences in the future. This case serves as a reminder of the importance of maintaining the integrity of educational assessments and ensuring that merit prevails in academic admissions.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),

       News(
        title: 'Clashes Over Durga Puja.',
        description: 'One dead, 17 injured in Tripura during donation clashes.',
        imageUrl: 'https://img.etimg.com/thumb/width-420,height-315,imgsize-80498,resizemode-75,msid-114018375/news/india/one-killed-17-injured-in-tripura-clashes-over-durga-puja-donations.jpg',
        content: 'In Kadamtala, Tripura, violent clashes erupted over donations for Durga Puja, resulting in the death of one person and injuries to 17 others. The situation escalated as groups fought over financial contributions for the festival, leading to chaos in the area. To restore order, police resorted to air firing and used lathi charges to disperse the mob. In response to the violence, prohibitory orders were imposed to prevent further unrest, and eight individuals have been arrested in connection with the clashes. Local authorities are now working to calm the situation and ensure that such incidents do not recur. The police presence has increased to maintain peace, and community leaders are being urged to promote harmony during this festive season. Durga Puja is a significant festival in Tripura, celebrated with much enthusiasm. However, such violent incidents can overshadow the spirit of the festivities. It is essential for the community to come together and focus on the positive aspects of the celebration, rather than letting disputes over donations lead to violence. The government and local authorities are expected to implement measures to ensure safety and security during the ongoing festivities, fostering a peaceful environment for all residents.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),

       News(
        title: 'Global Experts Discuss India.',
        description: 'Experts gather to discuss India’s global economic role and ambitions.',
        imageUrl: 'https://images.pexels.com/photos/3476860/pexels-photo-3476860.jpeg',
        content: 'Recently, over 150 global experts gathered at the Kautilya Economic Conclave in New Delhi to discuss India’s vital role in shaping global economic agendas. The discussions centered on critical themes such as climate goals, the green transition, and inclusive growth. Participants emphasized the importance of these topics in the context of India’s ambitions to become a developed economy by the year 2047. The conclave provided a platform for experts from various fields to exchange ideas and strategies on how India can lead in these areas. With climate change becoming an urgent issue worldwide, the focus on sustainable development and green initiatives is more relevant than ever. The experts highlighted that transitioning to a green economy would not only address environmental concerns but also create new job opportunities and drive economic growth. Furthermore, the discussions reinforced the idea that inclusive growth is crucial for India’s development. This means ensuring that economic progress benefits all sections of society, especially marginalized communities. By prioritizing these goals, India aims to position itself as a leader on the global stage, influencing economic policies and practices. In conclusion, the Kautilya Economic Conclave served as an important forum for shaping India’s future economic strategies, highlighting the country’s commitment to addressing global challenges while aspiring for comprehensive national development. This gathering signifies a step towards realizing India’s potential and vision for 2047.',
        url: 'https://economictimes.indiatimes.com/news/india/bootlegging-big-menace-needs-to-be-curbed-with-heavy-hand-delhi-hc/articleshow/114020666.cms',
        category: 'Top News',
       ),


    ];
    _filteredNewsList = _newsList; // Initially, display all news
  }

  void filterNews(String category) {
    setState(() {
      if (category == 'All') {
        _filteredNewsList = _newsList; // Show all news
      } else {
        _filteredNewsList = _newsList
            .where((news) => news.category == category)
            .toList(); // Filter news based on category
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Times',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: widget.toggleTheme, // Call the toggleTheme function
          ),
        ],
        flexibleSpace: Image.network(
          'https://img.freepik.com/premium-photo/abstract-background-design-hd-dark-red-color_851755-199743.jpg',
          fit: BoxFit.cover,
        ),
        toolbarHeight: 90,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Buttons Row with Horizontal Scroll
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () => filterNews('All'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding inside the button
            textStyle: const TextStyle(
              fontSize: 15, // Increased font size
            ),
          ),
          child: const Text('All'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => filterNews('Top News'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child: const Text('Top News'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => filterNews('Politics'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child: const Text('Politics'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => filterNews('Markets'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child: const Text('Markets'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => filterNews('Investment'),
          
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 15,
            ),
          ),
          child: const Text('Investment'),
        ),
      ],
    ),
  ),
),
          const SizedBox(height: 20),
          // News List
          Expanded(
            child: ListView.builder(
              itemCount: _filteredNewsList.length,
              itemBuilder: (context, index) {
                final news = _filteredNewsList[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detailed news screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(news: news),
                      ),
                    );
                  },
                  child: Card( 
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            news.imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news.title,
                            style: const TextStyle(
                              fontFamily: 'Futura Bold',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// NewsDetailsScreen Class
class NewsDetailsScreen extends StatelessWidget {
  final News news;

  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title,
          style: const TextStyle(
            fontFamily: 'Futura Bold',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  news.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                news.content,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(news.url))) {
                    await launchUrl(Uri.parse(news.url));
                  } else {
                    throw 'Could not launch ${news.url}';
                  }
                },
                child: const Text('Read More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// LoginScreen Class
class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess; // Callback for successful login

  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Simulate a login process
    // Assuming login success for this example
    widget.onLoginSuccess();
  }
  //login support

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}