-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-01-2020 a las 22:31:37
-- Versión del servidor: 10.2.30-MariaDB-cll-lve
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fuseygjj_multiclinica_hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accountant`
--

CREATE TABLE `accountant` (
  `id` int(100) NOT NULL,
  `img_url` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accountant`
--

INSERT INTO `accountant` (`id`, `img_url`, `name`, `email`, `address`, `phone`, `x`, `ion_user_id`) VALUES
(72, 'uploads/favicon7.png', 'Sr contador', 'contador@dms.com', 'New York, USA', '+9975 6765 7654', '', '112');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment`
--

CREATE TABLE `appointment` (
  `id` int(100) NOT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `time_slot` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `e_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `remarks` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `add_date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `registration_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_time_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `request` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bankb`
--

CREATE TABLE `bankb` (
  `id` int(100) NOT NULL,
  `group` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bankb`
--

INSERT INTO `bankb` (`id`, `group`, `status`) VALUES
(1, 'A+', '0 Bags'),
(2, 'A-', '0 Bags'),
(3, 'B+', '0 Bags'),
(4, 'B-', '0 Bags'),
(5, 'AB+', '0 Bags'),
(6, 'AB-', '0 Bags'),
(7, 'O+', '0 Bags'),
(8, 'O-', '0 Bags');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostic_report`
--

CREATE TABLE `diagnostic_report` (
  `id` int(100) NOT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `invoice` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `report` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `id` int(10) NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `department` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `profile` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`id`, `img_url`, `name`, `email`, `address`, `phone`, `department`, `profile`, `x`, `y`, `ion_user_id`) VALUES
(133, 'uploads/download_(2)1.png', 'Sr Doctor', 'doctor@dms.com', 'Collegepara, Rajbari -7700', '+0123456789', 'Cardiology', 'MD Cardiologo', '', '', '652');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donor`
--

CREATE TABLE `donor` (
  `id` int(100) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `group` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `age` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `ldd` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `add_date` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `id` int(100) NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `message` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `reciepient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`id`, `subject`, `date`, `message`, `reciepient`, `user`) VALUES
(12, 'Meeting', '1560941824', '<p>sdfdsfsdfsd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(11, 'MashaALlah Alhamdulillah', '1560941734', '<p>fvdbgfgffhfghfgh</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(10, 'thrtyryrty', '1560941667', '<p>rtyrtyrtyr</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(9, 'fgdfgdfgd', '1560941628', '<p>gdfgdfgdfgd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(8, 'sxsscsdcss', '1560941480', '<p>dcsdcsdcsdc</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(13, 'egrgvdfg', '1560943281', '<p>dfgdfgdfg</p>\n', 'All Patient', '1'),
(14, 'MashaALlah Alhamdulillah', '1560944788', '<p>fdgfdhdfhfgfg</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(15, 'sdfsdfds', '1561124017', '<p>fsdfsdfsd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(16, 'MashaALlah Alhamdulillah', '1561149967', '<p>gedfgdfgdfgd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(17, 'tryrttryryrt', '1561150052', '<p>yrtyrtyrtyr</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(18, 'MashaALlah Alhamdulillah', '1561150076', '<p>vfdgdgdgfdg</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(19, 'MashaALlah Alhamdulillah', '1561150317', '<p>gdfgfdgdg</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(20, 'vfgfgdfg', '1561150366', '<p>dfgdfgdfgdf</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(21, 'fgfdgdgd', '1561150381', '<p>fgdfgdfgdf</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(22, 'rfgfgdfgdf', '1561150398', '<p>gdfgdfgdfgf</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(23, 'gdfgdfgdfgdf', '1561150428', '<p>gdfgfdgdfg</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(24, 'gdfgdfgdfg', '1561150460', '<p>dfgdfgdfgd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(25, 'sdfsfsfs', '1561150477', '<p>dfdsfdsfsdf</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(26, 'fvffvdvdfv', '1561150563', '<p>dfvdfvfdvdf</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(27, 'MashaALlah Alhamdulillah', '1561150576', '<p>dcscsdcsd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(28, 'MashaALlah Alhamdulillah', '1561150594', '<p>fgdfgfdgdfgd</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(29, 'xccascac', '1561152934', '<p>ascascacas</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1'),
(30, 'jcdsbcjkdsbcb', '1561152973', '<p>dcsdjkbcjsbcjs</p>\n', 'rizvi.mahmud.plabon@gmail.com', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_settings`
--

CREATE TABLE `email_settings` (
  `id` int(100) NOT NULL,
  `admin_email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `email_settings`
--

INSERT INTO `email_settings` (`id`, `admin_email`, `type`, `user`, `password`) VALUES
(1, 'something@yourdomain.com', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense`
--

CREATE TABLE `expense` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `featured`
--

CREATE TABLE `featured` (
  `id` int(100) NOT NULL,
  `img_url` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `profile` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `featured`
--

INSERT INTO `featured` (`id`, `img_url`, `name`, `profile`, `description`) VALUES
(1, 'uploads/images.jpg', 'Dr Momenuzzaman', 'Cardiac Specialized', 'Redantium, totam rem aperiam, eaque ipsa qu ab illo inventore veritatis et quasi architectos beatae vitae dicta sunt explicabo. Nemo enims sadips ipsums un.'),
(2, 'uploads/doctor.png', 'Dr RahmatUllah Asif', 'Cardiac Specialized', 'Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence'),
(3, 'uploads/download_(2)2.png', 'Dr A.R.M. Jamil', 'Cardiac Specialized', 'Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'Accountant', 'For Financial Activities'),
(4, 'Doctor', ''),
(5, 'Patient', ''),
(6, 'Nurse', ''),
(7, 'Pharmacist', ''),
(8, 'Laboratorist', ''),
(10, 'Receptionist', 'Receptionist');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `holidays`
--

CREATE TABLE `holidays` (
  `id` int(100) NOT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lab`
--

CREATE TABLE `lab` (
  `id` int(100) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `category_name` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `report` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date_string` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorist`
--

CREATE TABLE `laboratorist` (
  `id` int(100) NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `laboratorist`
--

INSERT INTO `laboratorist` (`id`, `img_url`, `name`, `email`, `address`, `phone`, `x`, `y`, `ion_user_id`) VALUES
(3, 'uploads/favicon1.png', 'Sr Laboratorista', 'laboratorista@dms.com', 'Tampa, Florida, USA', '+9976 65443 76547', '', '', '111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lab_category`
--

CREATE TABLE `lab_category` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `reference_value` varchar(1000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lab_category`
--

INSERT INTO `lab_category` (`id`, `category`, `description`, `reference_value`) VALUES
(35, 'Troponin-I', 'Pathological Test', ''),
(36, 'CBC (DIGITAL)', 'Pathological Test', ''),
(37, 'Eosinophil', 'Pathological Test', ''),
(38, 'Platelets', 'Pathological Test', ''),
(39, 'Malarial Parasites (MP)', 'Pathological Test', ''),
(40, 'BT/ CT', 'Pathological Test', ''),
(41, 'ASO Titre', 'Pathological Test', ''),
(42, 'CRP', 'Pathological Test', ''),
(43, 'R/A test', 'Pathological Test', ''),
(44, 'VDRL', 'Pathological Test', ''),
(45, 'TPHA', 'Pathological Test', ''),
(46, 'HBsAg (Screening)', 'Pathological Test', ''),
(47, 'HBsAg (Confirmatory)', 'Pathological Test', ''),
(48, 'CFT for Kala Zar', 'Pathological Test', ''),
(49, 'CFT for Filaria', 'Pathological Test', ''),
(50, 'Pregnancy Test', 'Pathological Test', ''),
(51, 'Blood Grouping', 'Pathological Test', ''),
(52, 'Widal Test', 'Pathological Test', '(70-110)mg/dl'),
(53, 'RBS', 'Pathological Test', ''),
(54, 'Blood Urea', 'Pathological Test', ''),
(55, 'S. Creatinine', 'Pathological Test', ''),
(56, 'S. cholesterol', 'Pathological Test', ''),
(57, 'Fasting Lipid Profile', 'Pathological Test', ''),
(58, 'S. Bilirubin', 'Pathological Test', ''),
(59, 'S. Alkaline Phosohare', 'Pathological Test', ''),
(61, 'S. Calcium', 'Pathological Test', ''),
(62, 'RBS with CUS', 'Pathological Test', ''),
(63, 'SGPT', 'Pathological Test', ''),
(64, 'SGOT', 'Pathological Test', ''),
(65, 'Urine for R/E', 'Pathological Test', ''),
(66, 'Urine C/S', 'Pathological Test', ''),
(67, 'Stool for R/E', 'Pathological Test', ''),
(68, 'Semen Analysis', 'Pathological Test', ''),
(69, 'S. Electrolyte', 'Pathological Test', ''),
(70, 'S. T3/ T4/ THS', 'Pathological Test', ''),
(71, 'MT', 'Pathological Test', ''),
(106, 'ESR', 'Patho Test', ''),
(107, 'FBS CUS', 'Pathological test', ''),
(108, 'Hb%', 'Pathological test', ''),
(114, '2HABF', 'Pathological test', ''),
(113, 'FBS', 'Pathological test', ''),
(115, 'S. TSH', 'Pathological test', ''),
(116, 'S. T3', 'Pathological test', ''),
(117, 'DC', 'Pathological test', ''),
(118, 'TC', 'Pathological test', ''),
(120, 'S. Uric acid', 'Pathological test', ''),
(126, 'eosinphil', 'Pathology Test', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(100) NOT NULL,
  `patient_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `patient_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `patient_phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `img_url` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `registration_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicine`
--

CREATE TABLE `medicine` (
  `id` int(100) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `price` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `box` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_price` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `quantity` int(100) DEFAULT NULL,
  `generic` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `effects` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `e_date` varchar(70) CHARACTER SET utf8 DEFAULT NULL,
  `add_date` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicine_category`
--

CREATE TABLE `medicine_category` (
  `id` int(100) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurse`
--

CREATE TABLE `nurse` (
  `id` int(100) NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `z` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nurse`
--

INSERT INTO `nurse` (`id`, `img_url`, `name`, `email`, `address`, `phone`, `x`, `y`, `z`, `ion_user_id`) VALUES
(8, 'uploads/favicon4.png', 'Sr Enfermera', 'enfermera@dms.com', 'Uttara, Dhaka', '+88 6878654335678', '', '', '', '109');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ot_payment`
--

CREATE TABLE `ot_payment` (
  `id` int(100) NOT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_c_s` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_a_s_1` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_a_s_2` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_anaes` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `n_o_o` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `c_s_f` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `a_s_f_1` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `a_s_f_2` varchar(11) CHARACTER SET utf8 DEFAULT NULL,
  `anaes_f` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ot_charge` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `cab_rent` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `seat_rent` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `others` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `discount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_fees` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `hospital_fees` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gross_total` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `flat_discount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `amount_received` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ot_payment`
--

INSERT INTO `ot_payment` (`id`, `patient`, `doctor_c_s`, `doctor_a_s_1`, `doctor_a_s_2`, `doctor_anaes`, `n_o_o`, `c_s_f`, `a_s_f_1`, `a_s_f_2`, `anaes_f`, `ot_charge`, `cab_rent`, `seat_rent`, `others`, `discount`, `date`, `amount`, `doctor_fees`, `hospital_fees`, `gross_total`, `flat_discount`, `amount_received`, `status`, `user`) VALUES
(85, '451', 'None', '123', 'None', '125', 'dbdbd', '', '1000', '0', '1000', '', '', '', '', '', '1506195494', '2000', '2000', '0', '2000', '', '1000', 'unpaid', '614');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient`
--

CREATE TABLE `patient` (
  `id` int(100) NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `birthdate` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `age` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bloodgroup` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `add_date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `registration_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `how_added` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `patient`
--

INSERT INTO `patient` (`id`, `img_url`, `name`, `email`, `doctor`, `address`, `phone`, `sex`, `birthdate`, `age`, `bloodgroup`, `ion_user_id`, `patient_id`, `add_date`, `registration_time`, `how_added`) VALUES
(1, 'uploads/download.jpg', 'Sr Paciente', 'paciente@dms.com', '133', 'Colegepara, Rajbari', '+0123456789', 'Male', '01-01-1987', '', 'A+', '681', '101223', '01/30/19', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_deposit`
--

CREATE TABLE `patient_deposit` (
  `id` int(10) NOT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `payment_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `deposited_amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `amount_received_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `deposit_type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gateway` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_material`
--

CREATE TABLE `patient_material` (
  `id` int(100) NOT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `date_string` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `vat` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `x_ray` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `flat_vat` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `discount` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `flat_discount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gross_total` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `remarks` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `hospital_amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `category_amount` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `category_name` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `amount_received` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `deposit_type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient_address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date_string` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymentGateway`
--

CREATE TABLE `paymentGateway` (
  `id` int(100) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `merchant_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `APIUsername` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `APIPassword` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `APISignature` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(1000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paymentGateway`
--

INSERT INTO `paymentGateway` (`id`, `name`, `merchant_key`, `salt`, `x`, `y`, `APIUsername`, `APIPassword`, `APISignature`, `status`) VALUES
(1, 'PayPal', '', '', '', '', 'API Username', 'API Password', 'API Signature', 'test'),
(2, 'Pay U Money', 'Merchant Key', 'Salt', '', '', '', '', 'Aaw-Fd69z.JLuiq13ejMN-CsSMuuAPEXWUFPF5QW9sD22fp1hosGIFKo', 'test');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_category`
--

CREATE TABLE `payment_category` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `c_price` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `d_commission` int(100) DEFAULT NULL,
  `h_commission` int(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `payment_category`
--

INSERT INTO `payment_category` (`id`, `category`, `description`, `c_price`, `type`, `d_commission`, `h_commission`) VALUES
(16, 'E.C.G', 'Payments from E.C.G', '250', 'diagnostic', 30, 0),
(78, 'USG - Pregnancy Pro', 'USG - Pregnancy Pro', '400', 'diagnostic', 30, 0),
(19, 'Ward Fee', 'Deposits from ward', '400', 'others', 0, 0),
(20, 'Admission Fees', 'Patient Admission Fees', '100', 'others', 0, 0),
(23, 'Oxyzen', 'Income From Oxyzen', '0', 'others', 0, 0),
(24, 'Nebulizer', 'Income From Nebulizer', '60', 'others', 0, 0),
(25, 'Newspaper sell', 'Income From selling old newspaper', '0', 'others', 0, 0),
(33, 'Ambulance', 'Ambulance er vara', '0', 'others', 0, 0),
(34, 'HbAIc', 'gfdsegfdgd', '800', 'diagnostic', 30, 0),
(35, 'Troponin-I', 'Pathological Test', '1000', 'diagnostic', 30, 0),
(36, 'CBC (DIGITAL)', 'Pathological Test', '450', 'diagnostic', 30, 0),
(37, 'Eosinophil', 'Pathological Test', '100', 'diagnostic', 30, 0),
(38, 'Platelets', 'Pathological Test', '200', 'diagnostic', 30, 0),
(39, 'Malarial Parasites (MP)', 'Pathological Test', '100', 'diagnostic', 30, 0),
(40, 'BT/ CT', 'Pathological Test', '200', 'diagnostic', 30, 0),
(41, 'ASO Titre', 'Pathological Test', '250', 'diagnostic', 30, 0),
(42, 'CRP', 'Pathological Test', '400', 'diagnostic', 30, 0),
(43, 'R/A test', 'Pathological Test', '300', 'diagnostic', 30, 0),
(44, 'VDRL', 'Pathological Test', '200', 'diagnostic', 30, 0),
(45, 'TPHA', 'Pathological Test', '350', 'diagnostic', 30, 0),
(46, 'HBsAg (Screening)', 'Pathological Test', '300', 'diagnostic', 30, 0),
(47, 'HBsAg (Confirmatory)', 'Pathological Test', '600', 'diagnostic', 30, 0),
(48, 'CFT for Kala Zar', 'Pathological Test', '0', 'diagnostic', 0, 0),
(49, 'CFT for Filaria', 'Pathological Test', '0', 'diagnostic', 0, 0),
(50, 'Pregnancy Test', 'Pathological Test', '150', 'diagnostic', 30, 0),
(51, 'Blood Grouping', 'Pathological Test', '100', 'diagnostic', 30, 0),
(52, 'Widal Test', 'Pathological Test', '300', 'diagnostic', 30, 0),
(53, 'RBS', 'Pathological Test', '100', 'diagnostic', 30, 0),
(54, 'Blood Urea', 'Pathological Test', '250', 'diagnostic', 30, 0),
(55, 'S. Creatinine', 'Pathological Test', '250', 'diagnostic', 30, 0),
(56, 'S. cholesterol', 'Pathological Test', '250', 'diagnostic', 30, 0),
(57, 'Fasting Lipid Profile', 'Pathological Test', '850', 'diagnostic', 30, 0),
(58, 'S. Bilirubin', 'Pathological Test', '150', 'diagnostic', 30, 0),
(59, 'S. Alkaline Phosohare', 'Pathological Test', '300', 'diagnostic', 30, 0),
(60, 'S. Albumin', 'Pathological Test', '250', 'diagnostic', 30, 0),
(61, 'S. Calcium', 'Pathological Test', '350', 'diagnostic', 30, 0),
(62, 'RBS with CUS', 'Pathological Test', '160', 'diagnostic', 30, 0),
(63, 'SGPT', 'Pathological Test', '300', 'diagnostic', 30, 0),
(64, 'SGOT', 'Pathological Test', '300', 'diagnostic', 30, 0),
(65, 'Urine for R/E', 'Pathological Test', '150', 'diagnostic', 30, 0),
(66, 'Urine C/S', 'Pathological Test', '350', 'diagnostic', 30, 0),
(67, 'Stool for R/E', 'Pathological Test', '150', 'diagnostic', 30, 0),
(68, 'Semen Analysis', 'Pathological Test', '300', 'diagnostic', 30, 0),
(69, 'S. Electrolyte', 'Pathological Test', '800', 'diagnostic', 30, 0),
(70, 'S. T3/ T4/ THS', 'Pathological Test', '1000', 'diagnostic', 30, 0),
(71, 'MT', 'Pathological Test', '150', 'diagnostic', 30, 0),
(77, 'USG - Whole Abdomen ', 'USG - Whole Abdomen ', '400', 'diagnostic', 30, 0),
(73, 'ECHO Normal', 'ksdjkfsd', '700', 'diagnostic', 30, 0),
(76, 'x-ray chest', 'Normal', '200', 'diagnostic', 10, 0),
(79, 'USG - KUB', 'USG - KUB', '500', 'diagnostic', 20, 0),
(80, 'USG - Liver', 'USG - Liver', '400', 'diagnostic', 30, 0),
(81, 'USG - Breast (Left)', 'USG - Breast (Left)', '400', 'diagnostic', 30, 0),
(82, 'USG - Breast (Right)', 'USG - Breast (Right)', '400', 'diagnostic', 30, 0),
(83, 'X-RAY - Ba MealS+D  ', 'X-RAY - Ba MealS+D  ', '1400', 'diagnostic', 20, 0),
(84, 'X-RAY - Ba Swallo Oesopha', 'X-RAY - Ba Swallo Oesopha', '1000', 'diagnostic', 20, 0),
(85, 'X-RAY - KUB                         ', 'X-RAY - KUB ', '500', 'diagnostic', 20, 0),
(86, 'X-RAY - Leg Joint(B/V)(L/R)', 'X-RAY - Leg Joint(B/V)(L/R)', '500', 'diagnostic', 20, 0),
(87, 'X-RAY -Knee Joint(L/R)', 'X-RAY -Knee Joint(L/R)', '500', 'diagnostic', 20, 0),
(88, 'X-RAY - Finger(B/V) ', 'X-RAY - Finger(B/V) ', '350', 'diagnostic', 20, 0),
(89, 'X-RAY - Wrist(B/V)(L/R) ', 'X-RAY - Wrist(B/V)(L/R) ', '350', 'diagnostic', 20, 0),
(90, 'X-RAY - Hand(B/V)(L/R)                   ', 'X-RAY - Hand(B/V)(L/R)       ', '350', 'diagnostic', 20, 0),
(91, 'X-RAY - Elbow(B/V)(L/R)', 'X-RAY - Elbow(B/V)(L/R)', '350', 'diagnostic', 20, 0),
(92, 'X-RAY - Erm(B/V)(L/R )', 'X-RAY - Erm(B/V)(L/R )', '350', 'diagnostic', 20, 0),
(93, 'X-RAY - Shoulder Joint (B/V)', 'X-RAY - Shoulder Joint (B/V)', '500', 'diagnostic', 20, 0),
(94, 'X-RAY - Shoulder Joint (A/P)', 'X-RAY - Shoulder Joint (A/P)', '350', 'diagnostic', 20, 0),
(95, 'X-RAY - Foot (B/V)', 'X-RAY - Foot (B/V)', '350', 'diagnostic', 20, 0),
(96, 'X-RAY - Thigh(B/V)', 'X-RAY - Thigh(B/V)', '500', 'diagnostic', 20, 0),
(97, 'X-RAY - Ankle(B/V)', 'X-RAY - Ankle(B/V)', '350', 'diagnostic', 20, 0),
(98, 'X-RAY - Hip Joint(A/P)', 'X-RAY - Hip Joint(A/P)', '350', 'diagnostic', 20, 0),
(99, 'X-RAY - Pelvis(A/P)', 'X-RAY - Pelvis(A/P)', '500', 'diagnostic', 20, 0),
(100, 'X-RAY - L/S(B/V)(Lamber Spine)', 'X-RAY - L/S(B/V)(Lamber Spine)', '500', 'diagnostic', 20, 0),
(101, 'X-RAY - L/S(A/P)(LamberSpine)', 'X-RAY - L/S(A/P)(LamberSpine)', '500', 'diagnostic', 20, 0),
(102, 'X-RAY - D/L(A/P)(Thoracic)', 'X-RAY - D/L(A/P)(Thoracic)', '500', 'diagnostic', 20, 0),
(103, 'X-RAY - Mandable(B/V)', 'X-RAY - Mandable(B/V)', '500', 'diagnostic', 20, 0),
(104, 'X-RAY -C/S(AP)(Carvicai)', 'X-RAY -C/S(AP)(Carvicai)', '500', 'diagnostic', 20, 0),
(105, 'X-RAY - PNS (AP)', 'X-RAY - PNS (AP)', '350', 'diagnostic', 20, 0),
(106, 'ESR', 'Patho Test', '150', 'diagnostic', 30, 0),
(107, 'FBS CUS', 'Pathological test', '160', 'diagnostic', 30, 0),
(108, 'Hb%', 'Pathological test', '100', 'diagnostic', 30, 0),
(109, 'Physio-Therapy', 'Therapy', '1000', '', 0, 0),
(114, '2HABF', 'Pathological test', '100', 'diagnostic', 30, 0),
(113, 'FBS', 'Pathological test', '100', 'diagnostic', 30, 0),
(115, 'S. TSH', 'Pathological test', '400', 'diagnostic', 30, 0),
(116, 'S. T3', 'Pathological test', '400', 'diagnostic', 30, 0),
(117, 'DC', 'Pathological test', '200', 'diagnostic', 30, 0),
(118, 'TC', 'Pathological test', '200', 'diagnostic', 30, 0),
(119, 'X-Ray CXR (Digital)', 'X-Ray', '500', 'diagnostic', 20, 0),
(120, 'S. Uric acid', 'Pathological test', '250', 'diagnostic', 30, 0),
(122, 'U.S.G OF L/A ', 'U.S.G', '400', 'diagnostic', 30, 0),
(125, 'Rt knee joient b/v', 'X-Ray', '500', 'diagnostic', 20, 0),
(126, 'eosinphil', 'Pathology Test', '100', 'diagnostic', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacist`
--

CREATE TABLE `pharmacist` (
  `id` int(100) NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pharmacist`
--

INSERT INTO `pharmacist` (`id`, `img_url`, `name`, `email`, `address`, `phone`, `x`, `y`, `ion_user_id`) VALUES
(7, 'uploads/favicon6.png', 'Sr farmaceutico', 'farmaceutico@dms.com', 'Pottersbar, Hertfordshire, UK', '+4479 5665 543367', '', '', '110');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacy_expense`
--

CREATE TABLE `pharmacy_expense` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacy_expense_category`
--

CREATE TABLE `pharmacy_expense_category` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `y` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacy_payment`
--

CREATE TABLE `pharmacy_payment` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `vat` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `x_ray` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `flat_vat` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `discount` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `flat_discount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `gross_total` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `hospital_amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_amount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `category_amount` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `category_name` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `amount_received` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacy_payment_category`
--

CREATE TABLE `pharmacy_payment_category` (
  `id` int(10) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `c_price` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `d_commission` int(100) DEFAULT NULL,
  `h_commission` int(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescription`
--

CREATE TABLE `prescription` (
  `id` int(100) NOT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `patient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `symptom` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `advice` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dd` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `medicine` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `validity` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptionist`
--

CREATE TABLE `receptionist` (
  `id` int(100) NOT NULL,
  `img_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ion_user_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `receptionist`
--

INSERT INTO `receptionist` (`id`, `img_url`, `name`, `email`, `address`, `phone`, `x`, `ion_user_id`) VALUES
(7, '', 'Sr recepcionista', 'recepcionista@dms.com', 'Collegepara, Rajbari', '+0123456789', '', '614');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE `service` (
  `id` int(100) NOT NULL,
  `img_url` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`id`, `img_url`, `title`, `description`) VALUES
(1, '', 'Cardiac Excellence', 'Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence'),
(2, '', 'Cancer Treatment', 'Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence'),
(3, '', 'Stroke Management', 'Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence'),
(4, '', '24 / 7 Support', 'Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence Cardiac Excellence');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) NOT NULL,
  `system_vendor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `discount` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `vat` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `login_title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `invoice_logo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `payment_gateway` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sms_gateway` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `codec_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `codec_purchase_code` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `system_vendor`, `title`, `address`, `phone`, `email`, `facebook_id`, `currency`, `language`, `discount`, `vat`, `login_title`, `logo`, `invoice_logo`, `payment_gateway`, `sms_gateway`, `codec_username`, `codec_purchase_code`) VALUES
(1, 'multiclinica 3.0', 'multiclinica 3.0', 'Boropool, Rajbari-7700', '+0123456789', 'admin@demo.com', '#', '$', 'spanish', 'flat', 'percentage', 'Login Title', 'uploads/logo-nonetext1.png', '', 'PayPal', 'MSG91', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `img_url` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `text1` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `text2` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `text3` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `position` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `slide`
--

INSERT INTO `slide` (`id`, `title`, `img_url`, `text1`, `text2`, `text3`, `position`, `status`) VALUES
(1, 'Slider 1', 'uploads/1503411077revised-bhatia-homebanner-03.jpg', 'Welcome To Hospital', 'Hospital Management System', 'Hospital', '2', 'Active'),
(2, 'Best Hospital management System', 'uploads/1707260345350542.jpg', 'Best Hospital management System', 'Best Hospital management System', 'Best Hospital management System', '1', 'Inactive');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms`
--

CREATE TABLE `sms` (
  `id` int(100) NOT NULL,
  `date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `message` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `recipient` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` int(100) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `api_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sender` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `authkey` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `name`, `username`, `password`, `api_id`, `sender`, `authkey`, `user`) VALUES
(1, 'Clickatell', 'rizviplabon', '', '3570596', '', '', '1'),
(2, 'MSG91', '', '', '', '', '54646456546456456456456', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `template`
--

CREATE TABLE `template` (
  `id` int(100) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `template` varchar(10000) CHARACTER SET utf8 DEFAULT NULL,
  `user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `template`
--

INSERT INTO `template` (`id`, `name`, `template`, `user`, `x`) VALUES
(6, 'CBC', '<table align=\"center\" border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" >\n <thead>\n  <tr>\n   <th scope=\"col\">Head 1</th>\n   <th scope=\"col\">Head 2</th>\n   <th scope=\"col\">Head 3</th>\n   <th scope=\"col\">Head 4</th>\n   <th scope=\"col\">Head 5</th>\n  </tr>\n </thead>\n <tbody>\n  <tr>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n  </tr>\n  <tr>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n  </tr>\n </tbody>\n</table>\n\n<p>?</p>\n', '1', ''),
(3, 'Diagnostic', '<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n <tbody>\n  <tr>\n   <td>? ?Lab Name? ??</td>\n   <td>? ?Value? ? ?</td>\n  </tr>\n  <tr>\n   <td>?</td>\n   <td>?</td>\n  </tr>\n  <tr>\n   <td>?</td>\n   <td>?</td>\n  </tr>\n </tbody>\n</table>\n\n<p>?</p>\n', '1', ''),
(5, 'Lipid  Profile', '<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n <caption>Lipid Profile</caption>\n <thead>\n  <tr>\n   <th scope=\"col\">? ? ? Head1? ? ?</th>\n   <th scope=\"col\"><span>? ? ?Head2? ? ??</span></th>\n   <th scope=\"col\"><span>? ? ? Head3? ? ??</span></th>\n   <th scope=\"col\"><span>? ? ? Head4? ? ??</span></th>\n   <th scope=\"col\"><span>? ? ? Head5? ? ??</span></th>\n  </tr>\n </thead>\n <tbody>\n  <tr>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n  </tr>\n  <tr>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n   <td>?</td>\n  </tr>\n </tbody>\n</table>\n\n<p>?</p>\n', '1', ''),
(8, 'superadmin', '<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n <tbody>\n  <tr>\n   <td>gddgdga</td>\n   <td>gdgfdgdgfdgd</td>\n  </tr>\n  <tr>\n   <td>fgdfgdff</td>\n   <td>gfgdgfdgfd</td>\n  </tr>\n  <tr>\n   <td>gfdgfdd</td>\n   <td>\n   <p>gggfgfdgfdgd</p>\n\n   <p>?</p>\n   </td>\n  </tr>\n </tbody>\n</table>\n\n<p>?</p>\n', '1', ''),
(9, 'Lipid Profile Result', '<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" summary=\"Result Of Lipid Profile \">\n <caption>Lipid Profile Result</caption>\n <tbody>\n  <tr>\n   <td>SL</td>\n   <td>Test Name</td>\n   <td>Test Result</td>\n   <td> Reference Valur</td>\n   <td> Comment</td>\n  </tr>\n  <tr>\n   <td>1</td>\n   <td>Lipid Profile</td>\n   <td>   100</td>\n   <td>     >10 < 150</td>\n   <td> Normal</td>\n  </tr>\n  <tr>\n   <td>2</td>\n   <td>Lipid Profile</td>\n   <td>   100</td>\n   <td>     >10 < 150</td>\n   <td> Normal</td>\n  </tr>\n  <tr>\n   <td>3</td>\n   <td>Lipid Profile</td>\n   <td>   100</td>\n   <td>     >10 < 150</td>\n   <td> Normal</td>\n  </tr>\n  <tr>\n   <td>4</td>\n   <td>Lipid Profile</td>\n   <td>   100</td>\n   <td>     >10 < 150</td>\n   <td> Normal</td>\n  </tr>\n </tbody>\n</table>\n\n<p>?</p>\n', '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `time_schedule`
--

CREATE TABLE `time_schedule` (
  `id` int(100) NOT NULL,
  `doctor` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `weekday` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `e_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_time_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `duration` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `time_slot`
--

CREATE TABLE `time_slot` (
  `id` int(100) NOT NULL,
  `doctor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `e_time` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `weekday` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `s_time_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'admin', '$2y$08$EsaKT2M8qXHVS5vOFmnF5O9stKpqdwO9XM9o9XGFIl.j1/LpzyGqm', '', 'admin@dms.com', '', 'eX0.Bq6nP57EuXX4hJkPHO973e7a4c25f1849d3a', 1511432365, 'zCeJpcj78CKqJ4sVxVbxcO', 1268889823, 1578108513, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(109, '113.11.74.192', 'Sr Enfermera', '$2y$08$PSVkPRrzJjaTqQ.voEOsmOfEytSfOX6H9n0hlBwDyDi8AgV4o4QGW', NULL, 'enfermera@dms.com', NULL, NULL, NULL, NULL, 1435082243, 1578108541, 1, NULL, NULL, NULL, NULL),
(110, '113.11.74.192', 'Sr farmaceutico', '$2y$08$2oXzYg1Ox9L8igKV8HFsvu.j5Oq3rzu8GqCT.THTtUE1rM3KCfhfa', NULL, 'farmaceutico@dms.com', NULL, NULL, NULL, 'mbeMop6vTuscFYmD2M4Iqu', 1435082359, 1578108557, 1, NULL, NULL, NULL, NULL),
(111, '113.11.74.192', 'Sr Laboratorista', '$2y$08$hKroDFD0iwDdxIryXvBziO59sYgCKKyosi0vAqYHNKOCIU4u8YfDi', NULL, 'laboratorista@dms.com', NULL, NULL, NULL, NULL, 1435082438, 1578108618, 1, NULL, NULL, NULL, NULL),
(112, '113.11.74.192', 'Sr contador', '$2y$08$y55tqOTcnpji1HMaZYp2MOdEZN8Qjxxb0kxrPMb0tix/xYC7M.sLa', NULL, 'contador@dms.com', NULL, NULL, NULL, NULL, 1435082637, 1578108591, 1, NULL, NULL, NULL, NULL),
(610, '103.231.162.58', 'sdhsjgj', '$2y$08$JBdbYvWr0BaswifulhauLOBizxRMnx1XZeuaUNJ6utt4AqH.7c/je', NULL, 'jgjjhjgjh', NULL, NULL, NULL, NULL, 1505800387, NULL, 1, NULL, NULL, NULL, NULL),
(611, '103.231.162.58', 'vsgdvfds', '$2y$08$N3qoioTmznb7./7dhrfXp.ZAp7H1Vu2rU.EWdFUx5z7ECcm.la7Ee', NULL, 'hfhgfhfhgf', NULL, NULL, NULL, NULL, 1505800659, NULL, 1, NULL, NULL, NULL, NULL),
(612, '103.231.162.58', 'vsgdvfds1', '$2y$08$rjDLi21IP2Dncaz/FgXkJ.DYoxoYigHOjgkv4MgQby.2UQ5G61qVm', NULL, 'hfhgfhfhgfefeer', NULL, NULL, NULL, NULL, 1505800739, NULL, 1, NULL, NULL, NULL, NULL),
(614, '103.231.162.58', 'Sr recepcionista', '$2y$08$gRED3Xn8w6N58iZJWx7zWei72MlpRGNiDMms2aYKrKD31hVLgqbGW', NULL, 'recepcionista@dms.com', NULL, NULL, NULL, NULL, 1505800835, 1578108632, 1, NULL, NULL, NULL, NULL),
(652, '103.231.162.58', 'Sr Doctor', '$2y$08$kkR4on4f12tFQ8ZVO039lOkgjYOCIX6HhiGZXcLJaw5dAErZbvPAy', NULL, 'doctor@dms.com', NULL, NULL, NULL, NULL, 1510865807, 1578108525, 1, NULL, NULL, NULL, NULL),
(681, '103.231.161.30', 'Sr Paciente', '$2y$08$bmrV0FkY.cymcx9n5l333O/CT7A4wXpe7tJkFMr4t9qMjw5GHU.9m', NULL, 'paciente@dms.com', NULL, NULL, NULL, NULL, 1548872582, 1578108607, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(111, 109, 6),
(112, 110, 7),
(113, 111, 8),
(114, 112, 3),
(613, 611, 10),
(614, 612, 10),
(616, 614, 10),
(654, 652, 4),
(683, 681, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `website_settings`
--

CREATE TABLE `website_settings` (
  `id` int(100) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `logo` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `emergency` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `support` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `block_1_text_under_title` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `service_block__text_under_title` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `doctor_block__text_under_title` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `twitter_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `google_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `youtube_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `skype_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `x` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `website_settings`
--

INSERT INTO `website_settings` (`id`, `title`, `logo`, `address`, `phone`, `emergency`, `support`, `email`, `currency`, `block_1_text_under_title`, `service_block__text_under_title`, `doctor_block__text_under_title`, `facebook_id`, `twitter_id`, `google_id`, `youtube_id`, `skype_id`, `x`) VALUES
(1, 'Doctor Care', '', 'Boropool, Rajbari-7700', '+0123456789', '+0123456789', '+0123456789', 'admin@demo.com', '$', 'Best Hospital In The City', 'Aenean nibh ante, lacinia non tincidunt nec, lobortis ut tellus. Sed in porta diam.', 'We work with forward thinking clients to create beautiful, honest and amazing things that bring positive results.', 'https://www.facebook.com/rizvi.plabon', 'https://www.facebook.com/rizvi.plabon', 'https://www.facebook.com/rizvi.plabon', 'https://www.facebook.com/rizvi.plabon', 'https://www.facebook.com/rizvi.plabon', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bankb`
--
ALTER TABLE `bankb`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diagnostic_report`
--
ALTER TABLE `diagnostic_report`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `featured`
--
ALTER TABLE `featured`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `laboratorist`
--
ALTER TABLE `laboratorist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lab_category`
--
ALTER TABLE `lab_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ot_payment`
--
ALTER TABLE `ot_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patient_deposit`
--
ALTER TABLE `patient_deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patient_material`
--
ALTER TABLE `patient_material`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paymentGateway`
--
ALTER TABLE `paymentGateway`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_category`
--
ALTER TABLE `payment_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pharmacy_expense`
--
ALTER TABLE `pharmacy_expense`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pharmacy_expense_category`
--
ALTER TABLE `pharmacy_expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pharmacy_payment`
--
ALTER TABLE `pharmacy_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pharmacy_payment_category`
--
ALTER TABLE `pharmacy_payment_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `time_schedule`
--
ALTER TABLE `time_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indices de la tabla `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accountant`
--
ALTER TABLE `accountant`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT de la tabla `bankb`
--
ALTER TABLE `bankb`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `diagnostic_report`
--
ALTER TABLE `diagnostic_report`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `donor`
--
ALTER TABLE `donor`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `email`
--
ALTER TABLE `email`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `featured`
--
ALTER TABLE `featured`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `lab`
--
ALTER TABLE `lab`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1924;

--
-- AUTO_INCREMENT de la tabla `laboratorist`
--
ALTER TABLE `laboratorist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `lab_category`
--
ALTER TABLE `lab_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2865;

--
-- AUTO_INCREMENT de la tabla `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `nurse`
--
ALTER TABLE `nurse`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ot_payment`
--
ALTER TABLE `ot_payment`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `patient_deposit`
--
ALTER TABLE `patient_deposit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1586;

--
-- AUTO_INCREMENT de la tabla `patient_material`
--
ALTER TABLE `patient_material`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2013;

--
-- AUTO_INCREMENT de la tabla `paymentGateway`
--
ALTER TABLE `paymentGateway`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payment_category`
--
ALTER TABLE `payment_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pharmacy_expense`
--
ALTER TABLE `pharmacy_expense`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `pharmacy_expense_category`
--
ALTER TABLE `pharmacy_expense_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `pharmacy_payment`
--
ALTER TABLE `pharmacy_payment`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1970;

--
-- AUTO_INCREMENT de la tabla `pharmacy_payment_category`
--
ALTER TABLE `pharmacy_payment_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `service`
--
ALTER TABLE `service`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `template`
--
ALTER TABLE `template`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `time_schedule`
--
ALTER TABLE `time_schedule`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `time_slot`
--
ALTER TABLE `time_slot`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2085;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=682;

--
-- AUTO_INCREMENT de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=684;

--
-- AUTO_INCREMENT de la tabla `website_settings`
--
ALTER TABLE `website_settings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
