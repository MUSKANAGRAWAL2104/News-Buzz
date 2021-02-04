-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2021 at 11:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Tag_line` text NOT NULL,
  `Slug` varchar(25) NOT NULL,
  `Content` varchar(2000) NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `Title`, `Tag_line`, `Slug`, `Content`, `img_file`, `Date`) VALUES
(1, 'Delhi statehood solution lies', '', 'delhi-news', 'Surely, in such a context, we can\'t be having an administrative system falling between the two stools of the national capital and a weakened city administration? As law and order is an important issue in a city bustling with migrants and slums, it is but natural that Delhi needs a police force that is accountable to an elected government. There are other administrative areas as well but whatever the detail, Delhi\'s citizens need a more accountable and empowered local administration.\r\n\r\nBut let that not hurry us into a simplistic approach. New Delhi deserves to exist as a separate political entity because there is a need to carefully administer the security, prestige and convenience of a zone that has diplomats, expatriates, administrators and federal lawmakers. In that sense, making the heart of the city a Union Territory and defining the other parts of Delhi as a fully-fledged state makes broad sense.\r\n\r\nHowever, Delhi is inherently cosmopolitan now and is governed by the country\'s Constitution, which allows free movement of its citizens and the right to practise any profession. The moment you define Delhi as a state in a narrow sense of the term, populist politics begins to haunt the city by offering extra benefits to domiciles. That is not fair. Sheila Dixit has a point then in saying that full statehood for Delhi goes against the Constitution, but that is a half-truth. As a leader of the Congress Party that industrialised several suburbs of Delhi, she has to say how its citizens will get justice and an accountable administration on all fronts without the ghost of the Central government looming uselessly on local issues.\r\n', '13.jpg', '2021-02-04 14:32:10'),
(2, 'First fully-automated metro', '', 'first-metro', 'New Delhi: Prime Minister Narendra Modi inaugurated India\'s first driver-less metro train on the Delhi Metro\'s Magenta Line. This new train is fully automated thereby eliminating human error, officials said. The inauguration of the ground-breaking project took place today (December 28) through a virtual function.\r\nPrime Minister Modi said \"The inauguration of the first driver-less metro train shows how fast India is moving towards smart systems.\" \r\nFor the inauguration ceremony, the station was decorated with a red carpet and the train doors were decorated with garlands. This service is now available on Delhi Metro\'s Magenta Line which connects Janakpuri West in West Delhi to Botanical Garden in Noida. This will be extended to Delhi Metro\'s Pink Line by mid-2021.\r\nThe first Metro in Delhi was started with the efforts of Atal (Bihari Vajpayee) ji. When our govt was formed in 2014, only five cities had metro services and today 18 cities have Metro rail service. By 2025, we will take this service to more than 25 cities,\" PM Modi said in his virtual speech.\r\n ', '10.jpg', '2021-02-04 14:32:10'),
(3, 'MS Dhoni wins ICC Spirit of Cricket Award of Decade', '', 'dhoni-icc', 'Former Indian skipper Mahendra Singh Dhoni on Monday (December 28, 2020) won the ICC Spirit of Cricket Award of the Decade.\r\n\r\nOne of India\'s most successful captains won the ICC Spirit of Cricket Award of the Decade for his gesture at the beginning of the decade. \r\n\r\nMSD was chosen by fans unanimously for his gesture of calling back former England batter Ian Bell following a disputable runout at Trent Bridge in 2011. \r\n\r\n\r\nThe experienced wicketkeeper-batsman announced his retirement from international cricket in August this year. The 39-year-old took to his official Instagram account to confirm that he is calling curtains on his illustrious 16-year-long international career.\r\n\r\nThe captain cool had led India in a total of 199 matches in the 50-over format, guiding the side to 110 wins and 74 defeats. MSD also led India in 60 Test matches and helped the team clinch 27 wins.\r\n\r\nBesides this, Dhoni held a decent captaincy record in the Twenty20I format. Under him, the Indian team won 41 matches out of the 72 matches.\r\n\r\nHe guided India to World Twenty20 Cup in 2007 and then World Cup victory in 2011. He also led the team to the Champions Trophy title in 2013.\r\n\r\n\r\nMeanwhile, Indian current skipper Virat Kohli won the ICC men\'s ODI Player of the Decade award for his superb performance with the bat in the 50-over format. He also walked home with the Sir Garfield Sobers Award for ICC Men\'s Cricketer of the Decade. Kohli was nominated for the player of the decade award across all three formats.\r\n\r\nNotably, the ICC Awards of The Decade that recognise the best players across cricket over the past 10 years, invited fans to vote for the first time by selecting the winners across different categories. According to ICC, more than 1.5 million fans from across the globe participated and cast 5.3 million votes.\r\n', '11.jpg', '2021-02-04 14:35:26'),
(4, 'ISRO to set up regional academic centre for space ', '', 'isro-bhu', 'Indian Space Research Organization (ISRO) will set up its Regional Academic Center for Space (RAC-S) at IIT-BHU here under a memorandum of understanding (MoU) which IIT-BHU and ISRO signed on Wednesday to pave the way for advanced research in the future technology of the Indian space program.\r\nIIT-BHU director Prof Jain said that the Regional Academic Center for Space (RAC-S) of ISRO will act as a major facilitator for promoting space technology activities in the states of Uttar Pradesh, Madhya Pradesh, and Chhattisgarh. IIT-BHU will act as a catalyst for capacity building, awareness creation and R & D activities of ISRO. The activities of RAC-S shall be directed to maximize the utilization of research potential, infrastructure, expertise available at ISRO and IIT-BHU.\r\n\r\nHe further said IIT-BHU will be the leader and project monitor of RAC-S in which Institutes of Excellence in the field of science and technology in the states of Uttar Pradesh, Madhya Pradesh and Chhattisgarh will be roped into participate in various research and development activities.\r\nProf Jain further said that with the help of the RAC-S at IIT-BHU will leverage research in space science and space technology, space application, agriculture, telecommunications, meteorology, water resources to design developmental models for effective natural resource management. He iterated that such an initiative will greatly benefit the Purvanchal and Central regions of the country.\r\n', 'BHU.jpg', '2021-02-04 14:35:26'),
(5, 'Cristiano Ronaldo Wins Player Of The Year ', '', 'ronaldo-award', 'Cristiano Ronaldo has reportedly given his Globe Soccer \'Player of the Year\' award to Bayern Munich forward Robert Lewandowski in an incredible gesture.\r\nJuventus superstar Ronaldo was set to pick up the honour in Dubai on Sunday afternoon after a fan vote deemed him 2020\'s top performer.\r\n\r\nBut Tuttosport claim the 35-year-old and agent Jorge Mendes opted to turn it down.\r\n\r\nThe reason? They felt it was \'unfair\' and think Ronaldo only won it based on his own popularity, with Lewandowski being the deserved winner.\r\nLewandowski has scored 55 goals in 2020 and helped Bayern romp to the treble, topped off by a Champions League triumph in the summer.\r\n\r\nRonaldo did manage to notch an award for himself however and he was named \'Player of the Century\'.\r\n\r\nHe has made his name at some of the world\'s biggest clubs including Manchester United, Real Madrid and currently Juventus.\r\n\r\nThe 35-year-old gave a speech at the ceremony and said: \"For 20 consecutive years I have played and scored as a professional, I didn\'t know there was another record to beat.\r\n', '12.jpg', '2021-02-04 15:12:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
