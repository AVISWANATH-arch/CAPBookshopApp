using { my.bookshop as db } from '../db/schema';

service CatalogService {
  entity Books as projection on db.Books;
}


annotate CatalogService.Books with @UI.HeaderInfo : {
  TypeName : 'Book',
  TypeNamePlural : 'Books',
  Title : {
    Value : title
  }
};

annotate CatalogService.Books with @UI.LineItem : [
  { Value : ID },
  { Value : title },
  { Value : author },
  { Value : stock },
  { Value : price }
];

annotate CatalogService.Books with @UI.FieldGroup #General : {
  Data : [
    { Value : title },
    { Value : author },
    { Value : stock },
    { Value : price }
  ]
};

annotate CatalogService.Books with @UI.Facets : [
  {
    $Type  : 'UI.ReferenceFacet',
    Label  : 'Book Information',
    Target : '@UI.FieldGroup#General'
  }
];

