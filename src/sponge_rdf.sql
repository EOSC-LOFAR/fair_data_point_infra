SET u{FDP_URI} http://lofar-ld.lofarpipelines-astron.surf-hosted.nl:8080 ;

SPARQL
define get:soft "soft"
define get:method "GET"
SELECT *
FROM <http://dbpedia.org/resource/LOFAR>
FROM <$u{FDP_URI}/fdp>
FROM <$u{FDP_URI}/catalog/astron-01>
FROM <$u{FDP_URI}/dataset/lofar-lta-dbview>
FROM <$u{FDP_URI}/distribution/lofar-lta-dbview-sparql>
FROM <$u{FDP_URI}/distribution/lofar-lta-dbview-rdfdump>
FROM <$u{FDP_URI}/distribution/lofar-lta-dbview-sqldump>
FROM <$u{FDP_URI}/distribution/lofar-lta-dbview-csvdump>
WHERE { ?s ?p ?o } ;
