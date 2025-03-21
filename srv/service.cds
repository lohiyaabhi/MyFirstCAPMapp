using { abhishekdb.master as master ,  
       abhishekdb.transactional as trans} from '../db/demo';

service FirstService @(path : 'FirstService'){

    entity StudentSet @(
        odata.draft.enabled: true
    ) as projection on master.student;
    entity booksSet as projection on master.books;
    entity StandardSet as projection on master.standard;
    entity RentalSet as projection on trans.rentals;

}
