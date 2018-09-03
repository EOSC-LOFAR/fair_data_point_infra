SET u{FDP_URI} http://lofar-ld.lofarpipelines-astron.surf-hosted.nl:8080 ;

SPARQL
define get:soft "soft"
define get:method "GET"
define input:grab-seealso rdfs:seeAlso
SELECT * FROM <$u{FDP_URI}/fdp> WHERE { ?s ?p ?o };

SPARQL
define get:soft "soft"
define get:method "GET"
define input:grab-seealso rdfs:seeAlso
SELECT * FROM <$u{FDP_URI}/catalog/astron-01> WHERE { ?s ?p ?o };

SPARQL
define get:soft "soft"
define get:method "GET"
define input:grab-seealso rdfs:seeAlso
SELECT * FROM <$u{FDP_URI}/dataset/lofar-lta-dbview> WHERE { ?s ?p ?o };