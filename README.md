# ParkinSense
A Parkinson's Disease Detection Project.

## Introduction
### Abstract
ParkinSense is an iPad application that uses machine learning to detect early signs of Parkinson's disease from voice recordings and hand-drawn inputs. This app identifies subtle changes in vocal and motor functions. Patients can spot potential symptoms early, and healthcare providers can track disease progression non-invasively. This tool aims to reduce reliance on the current subjective diagnosis approach and improve management of Parkinson's disease. In our endeavor to achieve this, we are also incorporating proposed functions, a UML diagram, an initial prototype, and a report detailing individual contributions to date.

### Executive Summary
Parkinson's disease is the second most common neurodegenerative disease, affecting more than 1 million patients in the United States, trailing only Alzheimer's [1]. Forecasts suggest a rapid increase in the number, potentially doubling the global count of 7 million in 2020 by 2040 [2]. The financial strain is also significant, with the yearly costs of supporting a person with Parkinson's Disease (PPD) estimated to be $10,000 higher than individuals without, culminating in an annual expenditure of 23 billion US Dollars in the US [3]. Furthermore, many PPDs report psychological distress, diminished quality of life, and increased dependency on caregivers [4].

While there's currently no proven treatment [5], early diagnosis offers substantial benefits. It is highlighted by recent studies that early-stage PPDs who promptly undergo certain treatments can significantly reduce the worsening of symptoms like resting tremor [6]. Hence, detecting the disease at its early stages can be instrumental in slowing its progression, preserving the patient's quality of life, and mitigating socio-economic costs.

A distinct characteristic of Parkinson's disease is its influence on speech [7] and fine hand movements [8]. Individuals with Parkinson's often face motor-related challenges, exhibiting symptoms like monotone speech, dysarthria [9], and subtle inconsistencies in hand-drawn patterns due to muscle rigidity [10].

The traditional diagnostic method, Movement Disorder Society - Unified Parkinson's Disease Rating Scale (MDS-UPDRS), necessitates in-person visits and evaluations by healthcare professionals [11]. This method can be prone to errors from human interpretation [12] and poses a logistical challenge for many patients seeking medical attention. We are in a quest to make a non-intrusive software to capture both speech and handwriting data in routine settings. By utilizing machine learning, our solution aims to assist in identifying early signs of Parkinson's, offering both enhanced convenience for patients and a means for healthcare providers to manage the disease more efficiently.

## Motivation
### Competitive Analysis
The Movement Disorder Society - Unified Parkinson's Disease Rating Scale (MDS-UPDRS) is the predominant approach employed to evaluate diverse facets of Parkinson’s disease. This method amalgamates patients' self-reported data on daily living behaviors with examiners' observations of motor examination [11]. Despite its rigorous foundation backed by extensive research and a robust examiner qualification process [13], skepticism about the method persists. The primary concerns revolve around the absence of objective lab tests and a reliance on patient-reported data, which raises questions about its ability to reliably detect the early stages of PD [14]. Additionally, some argue that the rating system is marred by a significant amount of error variance [15]. It’s pertinent to note, however, that our software will integrate MDS-UPDRS ratings as a crucial input for machine learning. Critics of this approach argue that it may be hindered by the absence of an objective "ground-truth" score [16] and a lack of environmental supervision [17].

Upon searching for "Parkinson Disease" in the iOS App Store, we identified an app called "PD Me." This application attempts to diagnose PD based on users' self-assessed inputs through questionnaires, covering areas like mood, tremor, voice, and limb coordination. Notably, the last update for this app was seven years ago and failed to run on modern devices. Beyond "PD Me", the majority of available apps are geared towards assisting patients in tracking disease progress, scheduling, or rehabilitation.

Parkinson’s Disease-related apps on the market [19]
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Operating System</th>
      <th>Users</th>
      <th>Brief Description</th>
    </tr>
  </thead>
  <tr>
    <td>cloudUPDRS</td>
    <td>Google Play</td>
    <td>Professionals and patients</td>
    <td>App to measure gait, tremor, and reaction time.</td>
  </tr>
  <tr>
    <td>MyTremorApp</td>
    <td>Google Play</td>
    <td>Professionals and patients</td>
    <td>App to measure hand tremor and bradykinesia.</td>
  </tr>
  <tr>
    <td>ParkinsonAI</td>
    <td>Google Play/iOS</td>
    <td>Patients</td>
    <td>App to measure tremor and posture and proposes exercises and diets for the control of symptoms.</td>
  </tr>
  <tr>
    <td>Tremor Measurement</td>
    <td>Google Play</td>
    <td>Professionals</td>
    <td>App to assess tremor in amplitude and frequency.</td>
  </tr>
  <tr>
    <td>Cepha</td>
    <td>iOS</td>
    <td>Professionals and patients</td>
    <td>App to measure dysphonia, resting tremor, action tremor, and postural tremor.</td>
  </tr>
  <tr>
    <td>CYPD</td>
    <td>iOS</td>
    <td>Professionals and patients</td>
    <td>App to monitor symptoms and medication effectiveness. This information is sent to the clinician.</td>
  </tr>
  <tr>
    <td>Parkinson’s LifeKit</td>
    <td>iOS</td>
    <td>Patients</td>
    <td>App to manage PD. Presents cognitive and motor tests (voice, tapping, and tremor); a personal diary; medication reminders; and a result graphic to see variations in symptoms.</td>
  </tr>
  <tr>
    <td>Patana AI</td>
    <td>iOS</td>
    <td>Professionals</td>
    <td>App to evaluate tremor, posture, and movement.</td>
  </tr>
  <tr>
    <td>StudyMyTremor</td>
    <td>iOS</td>
    <td>Professionals and patients</td>
    <td>App to evaluate tremor in amplitude and frequency.</td>
  </tr>
  <tr>
    <td>Tremor Analysis</td>
    <td>iOS</td>
    <td>Professionals and patients</td>
    <td>App to assess tremor in frequency. It can be customized by choosing which parameters you want to measure.</td>
  </tr>
  <tr>
    <td>Tremor Measurer</td>
    <td>iOS</td>
    <td>Professionals</td>
    <td>App to assess tremor quantitatively.</td>
  </tr>
  <tr>
    <td>Tremor Measurer Lite</td>
    <td>iOS</td>
    <td>Professionals</td>
    <td>App to assess tremor quantitatively.</td>
  <tr>
    <td>TREMOR12</td>
    <td>iOS</td>
    <td>Professionals</td>
    <td>App to measure tremor parameters and analyze them later.</td>
  </tr>
</table>

In academic circles, a noteworthy effort from Australia deemed their PD diagnostic initiative as having "potential." However, they cited challenges related to the "accents" factor, attributable to the strong localization of their data source [18]. A follow-up search revealed that their application hasn't been published on any app stores. Further, a 2022 paper highlighted that, in their market research encompassing apps with a similar focus, only 1 out of 13 apps actively measured PD symptoms and offered predictions [19]. The rest were either dedicated to disease management or had been removed from the store at the time of our review.

### Journal Articles
Numerous studies have tackled the issue from diverse angles, focusing on various symptoms. Analytical methods encompass speech signals, handwriting patterns, gait, tremor, SPECT, MRI, ultrasound, PET, and combinations thereof [20]. Among these, voice and handwriting data have shown accuracies of 90.9% and 87.6%, respectively, yet combining them remains a less explored territory. Based on Amato's recent survey, insights in speech analysis include: (1) the prevalent use and reliability of MFCC features across learning models, (2) the non-impact of the recording device on performance while highlighting the significance of session supervision, and (3) the frequent use of DARTH-VAT for feature extraction [21]. For handwriting analysis, challenges abound, often linked to various factors corresponding to human input variations. Its image-based nature also necessitates a significantly larger dataset [22][23].

In developing our application, we derive key insights from existing research. When formulating hypotheses, it's important to question the feasibility of acquiring inputs like speech and handwriting in unsupervised settings and seek expert opinions on potential pitfalls. Data collection should span multiple avenues: from online public domains to grassroots community sources. In terms of modeling, it's essential to consider metrics beyond accuracy since both false positives and false negatives carry significant implications. For the application's implementation, the user interface is paramount. It should be designed to minimize user errors, particularly since our target demographic primarily consists of senior citizens.

## Requirements
ParkinSense will be used to detect early signs of Parkinson’s disease through the use of voice recordings and hand-drawn inputs. The given inputs are then used to give the user a score on the MDS-UPDRS. The user can also refer to past results, and test again if they choose to. Lastly, since it is recommended that they take tests every six months, there will also be an option to have notification reminders.

## Conclusion
In conclusion, ParkinSense aims to innovate Parkinson's disease detection by using machine learning to analyze voice and handwriting inputs. This method is aimed to contribute partially to the effort to overcome the limitations of existing diagnostic approaches and fill the gaps identified in current market offerings and academic research. We’ve considered insights from various studies, diverse data sources, modeling metrics, and emphasized a user-friendly interface, especially given our primary focus on senior citizens.

After initial user studies, including feedback from healthcare specialists and end-users, we’ve gained valuable insight that have led us to rethink our approach. Recognizing the limitations of our current datasets and algorithms, we are repositioning the app as a research tool to be used in clinical settings for data collection at least in its initial stages. This will allow us to refine its capabilities iteratively and better address the critical concerns raised about its scientific validity, inclusivity, and adaptability to complex cases.

As part of our renewed focus, we’ve revised our requirements documents to reflect the new features and functions that the app needs to incorporate, based on user feedback. This shift doesn’t signal a scaling back of our ambitions, but rather a more informed and realistic pathway to achieving them.

We remain optimistic about ParkinSense and its potential to contribute to a better understanding of Parkinson’s Disease and to improve the quality of life for those affected by it. While some things did not go according to plan, we hope that this app inspires us for things to come.

## References
[1] M. Ricci, G. Di Lazzaro, A. Pisani, N. B. Mercuri, F. Giannini, and G. Saggio, “Assessment of motor impairments in early untreated Parkinson’s disease patients: The Wearable Electronics Impact,” IEEE Journal of Biomedical and Health Informatics, vol. 24, no. 1, pp. 120–130, Jan. 2020, doi: 10.1109/jbhi.2019.2903627.
[2] E. R. Dorsey and B. R. Bloem, “The Parkinson Pandemic—A call to action,” JAMA Neurology, vol. 75, no. 1, p. 9, Jan. 2018, doi: 10.1001/jamaneurol.2017.3299.

[3] D. M. Huse, K. L. Schulman, L. Orsini, J. Castelli-Haley, S. K. Kennedy, and G. Lenhart, “Burden of illness in Parkinson’s disease,” Movement Disorders, vol. 20, no. 11, pp. 1449–1454, Jan. 2005, doi: 10.1002/mds.20609.

[4] I. Abeynayake, M. Klingler, and H. Roberts, “The financial burden of Parkinson’s disease is greater for caregivers of people experiencing OFF periods,” Parkinsonism & Related Disorders, vol. 79, p. e86, Oct. 2020, doi: 10.1016/j.parkreldis.2020.06.313.

[5] A. Schrag et al., “The late stage of Parkinson’s –results of a large multinational study on motor and non-motor complications,” Parkinsonism & Related Disorders, vol. 75, pp. 91–96, Jun. 2020, doi: 10.1016/j.parkreldis.2020.05.016.

[6] M. L. Hacker et al., “Deep brain stimulation in early-stage Parkinson disease,” Neurology, vol. 95, no. 4, pp. e393–e401, Jun. 2020, doi: 10.1212/wnl.0000000000009946.

[7] J. Rusz, R. Cmejla, H. Ruzickova, and E. Růžička, “Quantitative acoustic measurements for characterization of speech and voice disorders in early untreated Parkinson’s disease,” Journal of the Acoustical Society of America, vol. 129, no. 1, pp. 350–367, Jan. 2011, doi: 10.1121/1.3514381.

[8] J. Opara, A. Małecki, E. Małecka, and T. Socha, “Motor assessment in Parkinson's disease” Annals of Agricultural and Environmental Medicine, vol. 24, no. 3, pp. 411–415, Sep. 2017, doi: 10.5604/12321966.1232774.

[9] G. J. Canter, “Speech Characteristics of Patients with Parkinson’s Disease: I. Intensity, Pitch, and Duration,” Journal of Speech and Hearing Disorders, vol. 28, no. 3, pp. 221–229, Jul. 1963, doi: 10.1044/jshd.2803.221.

[10] P. Drotar, J. Mekyska, I. Rektorová, L. Masárová, Z. Smekal, and M. Faundez-Zanuy, “Evaluation of handwriting kinematics and pressure for differential diagnosis of Parkinson’s disease,” Artificial Intelligence in Medicine, vol. 67, pp. 39–46, Feb. 2016, doi: 10.1016/j.artmed.2016.01.004.

[11] C. G. Goetz et al., “Movement Disorder Society-sponsored revision of the Unified Parkinson’s Disease Rating Scale (MDS-UPDRS): Scale presentation and clinimetric testing results,” Movement Disorders, vol. 23, no. 15, pp. 2129–2170, Nov. 2008, doi: 10.1002/mds.22340.

[12] K. Kubota, J. Chen, and M. A. Little, “Machine learning for large-scale wearable sensor data in Parkinson’s disease: Concepts, promises, pitfalls, and futures,” Movement Disorders, vol. 31, no. 9, pp. 1314–1326, Aug. 2016, doi: 10.1002/mds.26693.

[13] “Assessment training programs” https://www.movementdisorders.org/MDS/MDS-Rating-Scales/Training-Programs.htm

[14] A. Regnault, B. Boroojerdi, J. Meunier, M. Bani, T. Morel, and S. Cano, “Does the MDS-UPDRS provide the precision to assess progression in early Parkinson’s disease? Learnings from the Parkinson’s progression marker initiative cohort,” Journal of Neurology, vol. 266, no. 8, pp. 1927–1936, May 2019, doi: 10.1007/s00415-019-09348-3.

[15] L. J. W. Evers, J. H. Krijthe, M. J. Meinders, B. R. Bloem, and T. Heskes, “Measuring Parkinson’s disease over time: The real‐world within‐subject reliability of the MDS‐UPDRS,” Movement Disorders, vol. 34, no. 10, pp. 1480–1487, Jul. 2019, doi: 10.1002/mds.27790.

[16] M. Lu et al., “Quantifying Parkinson’s disease motor severity under uncertainty using MDS-UPDRS videos,” Medical Image Analysis, vol. 73, p. 102179, Oct. 2021, doi: 10.1016/j.media.2021.102179.

[17] C. G. Goetz, G. T. Stebbins, and S. Luo, “Movement Disorder Society–Unified Parkinson’s Disease Rating Scale Use in the COVID‐19 Era,” Movement Disorders, vol. 35, no. 6, p. 911, May 2020, doi: 10.1002/mds.28094.

[18] “Parkinson’s disease detection using smartphone recorded phonemes in real world conditions,” IEEE Journals & Magazine | IEEE Xplore, 2022. https://ieeexplore.ieee.org/document/9887934 CS 472 Fall 2023 - Parkinson’s Disease Detection Project

[19] P. Moreta-De-Esteban, P. Martín-Casas, R. M. Ortiz-Gutiérrez, S. Straudi, and R. Cano-De-La-Cuerda, “Mobile Applications for Resting Tremor Assessment in Parkinson’s Disease: A Systematic review,” Journal of Clinical Medicine, vol. 12, no. 6, p. 2334, Mar. 2023, doi: 10.3390/jcm12062334.

[20] J. Mei, C. Desrosiers, and J. Frasnelli, “Machine Learning for the Diagnosis of Parkinson’s Disease: A Review of Literature,” Frontiers in Aging Neuroscience, vol. 13, May 2021, doi: 10.3389/fnagi.2021.633752.

[21] F. Amato, G. Saggio, V. Cesarini, G. Olmo, and G. Costantini, “Machine learning- and statistical-based voice analysis of Parkinson’s disease patients: A survey,” Expert Systems With Applications, vol. 219, p. 119651, Jun. 2023, doi: 10.1016/j.eswa.2023.119651.

[22] A. Talitckii et al., “Comparative study of wearable sensors, video, and handwriting to detect Parkinson’s disease,” IEEE Transactions on Instrumentation and Measurement, vol. 71, pp. 1–10, Jan. 2022, doi: 10.1109/tim.2022.3176898.

[23] S. S. Gornale, S. Kumar, R. Siddalingappa, and P. S. Hiremath, “Survey on Handwritten Signature Biometric Data Analysis for Assessment of Neurological Disorder using Machine Learning Techniques,” Transactions on Machine Learning and Artificial Intelligence, vol. 10, no. 2, pp. 27–60, Apr. 2022, doi: 10.14738/tmlai.102.12210.

[24] R. Kale and M. Menken, “Who should look after people with Parkinson’s disease?,” BMJ, vol. 328, no. 7431, pp. 62–63, Jan. 2004, doi: 10.1136/bmj.328.7431.62.
