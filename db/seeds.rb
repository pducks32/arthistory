# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def d(year, c: false)
  DateWithPossibleAmbiguity.create(date: year, approximation: c)
end

def c(year)
  { year: year, c: true }
end

def artwork(name, artist, medium, date, locatable, image_url)
  date = date.is_a?(Hash) ? d(date[:year], c: true) : d(date)
  Artwork.create name: name, medium: medium, artist: artist, creation_date: date, locatable: locatable, image_url: image_url
end

def artist(name, birth, death, full_name: nil)
  Artist.create name: Name.create(common: name, full: full_name), birth_date: d(birth), death_date: d(death)
end

berlinghieri = artist("Berlinghieri", 1210, 1287)
giotto = artist("Giotto", 1266, 1337)
lorenzetti = artist("Lorenzetti", 1290, 1348)
pisano = artist("Pisano", 1290, 1348)
limbourg = artist("Limbourg", 1385, 1416)
van_eyck = artist("Jan Van Eyck", 1390, 1441)
weyden = artist("Rogier van der Weyden", 1400, 1464)
campin = artist("Campin", 1375, 1444)
brunelleschi = artist("Brunelleschi", 1377, 1446)
ghiberti = artist("Ghiberti", 1378, 1455)
donatello = artist("Donatello", 1386, 1466)
fabriano = artist("Fabriano", 1370, 1427, full_name: "Gentile de Fabriano")
masaccio = artist("Masaccio", 1401, 1428)
masolino = artist("Masolino", 1383, 1447)
uccello = artist("Uccello", 1397, 1475)
michelozzo = artist("Michelozzo", 1396, 1472)
botticelli = artist("Botticelli", 1445, 1510)
di_banco = artist "di Banco", 1385, 1421, full_name: "Nanni di Banco"

a_birth_date = DateWithPossibleAmbiguity.new(date: 1395, approximation: true)
a_death_date = DateWithPossibleAmbiguity.new(date: 1455, approximation: false)
angelicos_name = Name.new first: "Guido", last: "di Pietro", title: "Fra", full: "Fra Giovanni Angelico", common: "Fra Angelico"
angelico = Artist.create name: angelicos_name, birth_date: a_birth_date, death_date: a_death_date, vasarian_age: 2


tempera = "tempera"
fresco = "fresco"
oil = "oil"
bronze = "bronze"
gilded_bronze = "gilded bronze"
marble = "marble"
tempera_on_wood = "tempera on wood"
paint_on_paper = "paint on paper"
stone = "stone"

berry = "The Tres Riches Heures de Due de Berry"

# Places
riches_heures = Place.new name: berry, alternative_name: "Book of Hours"
flanders = Region.create name: "Flanders", alternative_name: "Netherlands"

south_florentine_baptistry = Place.new name: "South Florentine Baptistry", alternative_name: "Florentine Baptistry"
baptistry_competition = Place.new name: "Baptistry Competition"
east_florentine_baptistry = Place.new name: "East Florentine Baptistry", alternative_name: "Florentine Baptistry"
orsanmichele = Place.new name: "Orsanmichele"
brancacci = Place.new name: "Brancacci Chapel"
medici = Place.new name: "Medici Palace", alternative_name: "Palazzo Medici"
san_marco_monastery = Place.new name: "San Marco Monastery", alternative_name: "San Marco"
florence = City.create name: "Florence", places: [san_marco_monastery, medici, brancacci, orsanmichele, east_florentine_baptistry, baptistry_competition, south_florentine_baptistry]

padua = City.create name: "Padua"

palazzo_pubblico = Place.new name: "Palazzo Publico", alternative_name: "Public Plaza"
siena = City.create name: "Siena", places: [palazzo_pubblico]

italy = Region.create name: "Italy", cities: [florence, siena, padua]




artwork( "Saint Francis Altarpiece", berlinghieri, tempera, 1235, italy, "https://upload.wikimedia.org/wikipedia/commons/a/a3/Bonaventura_Berlinghieri_Francesco.jpg")
artwork( "Madonna and Child Enthroned", giotto, tempera, 1310, florence, "https://upload.wikimedia.org/wikipedia/commons/6/6b/GiottoMadonna.jpg")
artwork( "The Arena Chapel", giotto, fresco, 1305, padua, "https://artchronicler.files.wordpress.com/2010/01/arena-chapel-inside.jpg")
artwork( "The Effects Of Good Government", lorenzetti, fresco, 1340, palazzo_pubblico, "https://mydailyartdisplay.files.wordpress.com/2011/02/sale-della-pace1.jpg")
artwork( "The Expulsion from Paradise", limbourg, paint_on_paper, 1450, riches_heures, "https://upload.wikimedia.org/wikipedia/commons/1/1a/Folio_25v_-_The_Garden_of_Eden.jpg")
artwork( "January", limbourg, paint_on_paper, 1450, riches_heures, "https://upload.wikimedia.org/wikipedia/commons/8/8a/Les_Très_Riches_Heures_du_duc_de_Berry_Janvier.jpg")
artwork( "October", limbourg, paint_on_paper, 1450, riches_heures, "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Les_Très_Riches_Heures_du_duc_de_Berry_juin.jpg/476px-Les_Très_Riches_Heures_du_duc_de_Berry_juin.jpg")
artwork( "May", limbourg, paint_on_paper, 1450, riches_heures, "http://files.libertyfund.org/img/2368/May1148.jpg")
artwork( "Arnolfini Wedding", van_eyck, oil, 1434, flanders, "https://upload.wikimedia.org/wikipedia/commons/3/33/Van_Eyck_-_Arnolfini_Portrait.jpg")
artwork( "Portrait of a Lady", weyden, oil, c(1460), flanders, "https://upload.wikimedia.org/wikipedia/commons/6/65/Rogier_van_der_Weyden_-_Portrait_of_a_Lady_-_Google_Art_Project.jpg")
artwork( "The Merode Altarpiece", campin, oil, 1428, flanders, "https://upload.wikimedia.org/wikipedia/commons/e/ef/Robert_Campin_-_Triptych_with_the_Annunciation,_known_as_the_%22Merode_Altarpiece%22_-_Google_Art_Project.jpg")
artwork( "Deposition", weyden, oil, 1435, flanders, "https://upload.wikimedia.org/wikipedia/commons/1/1a/Weyden_Deposition.jpg")
artwork( "Life of John the Baptist", pisano, bronze, c(1330), south_florentine_baptistry, "https://upload.wikimedia.org/wikipedia/commons/f/f6/South_Doors_of_the_Florence_Baptistry.JPG")
artwork( "Salome and Herodias", pisano, bronze, c(1330), south_florentine_baptistry, "http://www.squinchpix.com/Tranche7/FLOBRO_II_DSC3887.jpg")
artwork( "Sacrifice of Issac", brunelleschi, bronze, 1401, baptistry_competition, "https://maitaly.files.wordpress.com/2011/03/brunelleschi.jpg")
artwork( "Sacrifice of Issac", ghiberti, bronze, 1401, baptistry_competition, "http://www.bc.edu/bc_org/avp/cas/ashp/ghiberti-sacrifice-isaac.jpg")
artwork( "Gates of Paradise", ghiberti, gilded_bronze, 1452, east_florentine_baptistry, "https://upload.wikimedia.org/wikipedia/commons/d/d9/Florenca146.jpg")
artwork( "Saint Mark", donatello, marble, 1411, orsanmichele, "http://employees.oneonta.edu/farberas/arth/Images/110images/sl4images/Donatello_Mark.jpg")
artwork( "Saint George", donatello, marble, 1415, orsanmichele, "https://www.oneonta.edu/faculty/farberas/arth/Images/110images/sl4images/donatello_george2.jpg")
artwork( "Four Crowned Saints", di_banco, marble, 1416, orsanmichele, "http://www.bobandnellasworld.com/Italy%202009/Florence/AfterDark/r10_0575f.jpg")
artwork( "Adoration of the Magi", fabriano, tempera, 1423, florence, "https://upload.wikimedia.org/wikipedia/commons/b/b2/Gentile_da_Fabriano_Adoration.jpg")
artwork( "The Trinity", masaccio, fresco, 1428, florence, "https://upload.wikimedia.org/wikipedia/commons/d/d2/Masaccio,_trinità.jpg")
artwork( "Tribute Money", masaccio, fresco, 1425, brancacci, "https://upload.wikimedia.org/wikipedia/commons/b/b0/Masaccio7.jpg")
artwork( "The Expulsion", masaccio, fresco, 1425, brancacci, "https://upload.wikimedia.org/wikipedia/commons/0/02/Expulsion_from_the_Garden_of_Eden_Masaccio_Cappella_Brancacci.jpg")
artwork( "The Temptation", masolino, fresco, 1425, brancacci, "http://www.italianrenaissance.org/wp-content/uploads/2012/08/masolino-adam-eve.jpg")
artwork( "Battle of San Romano", uccello, tempera_on_wood, 1455, florence, "https://upload.wikimedia.org/wikipedia/commons/9/98/San_Romano_Battle_(Paolo_Uccello,_London)_01.jpg")
artwork( "Young Man Holding Medal of Cosimo de' Medici", botticelli, tempera, c(1475), florence, "https://upload.wikimedia.org/wikipedia/commons/b/b1/Sandro_Botticelli_-_Portrait_of_a_Man_with_a_Medal_of_Cosimo_the_Elder.jpg")
artwork( "The Medici Palace", michelozzo, stone, 1444, florence, "http://www.florencewebguide.com/images/palazzo-medici-riccardi-exterior.jpg")
artwork( "David", donatello, bronze, 1440, medici, "https://upload.wikimedia.org/wikipedia/commons/7/7f/Florence_-_David_by_Donatello.jpg")
artwork( "Annunciation", angelico, fresco, 1455, san_marco_monastery, "https://upload.wikimedia.org/wikipedia/commons/1/1b/ANGELICO,_Fra_Annunciation,_1437-46_(2236990916).jpg")
artwork( "Annunciation", angelico, fresco, 1455, san_marco_monastery, "http://www.museumsinflorence.com/foto/san%20marco/image/5.jpg")
artwork( "The Mocking of Christ", angelico, fresco, 1455, san_marco_monastery, "http://www.poderesantapia.com/images/art/fraangelico/mockingofchrist700.jpg")
