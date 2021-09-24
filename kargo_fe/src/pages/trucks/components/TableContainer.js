import {
  useTable,
  useFilters,
  useGlobalFilter,
  useSortBy,
  usePagination,
  useAsyncDebounce,
} from "react-table";

import { Button, Form, FormControl, InputGroup, Table } from "react-bootstrap";
import { TableFilter } from "./TableFilter";
import {
  FaSortDown,
  FaSortUp,
  FaSort,
  FaPlus,
  FaChevronLeft,
  FaChevronRight,
  FaSearch,
} from "react-icons/fa";
import React from "react";
import { getTruckTypes } from "../../../apis/truck-type.api";
import { LoadingIndicator } from "../../../components/Loading-Indicator";

export function TableContainer({
  columns,
  data,
  title,
  rowProps = () => ({}),
}) {
  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    prepareRow,
    page, // Instead of using 'rows', we'll use page,
    // which has only the rows for the active page

    // The rest of these things are super handy, too ;)
    canPreviousPage,
    canNextPage,
    pageOptions,
    // pageCount,
    // gotoPage,
    nextPage,
    previousPage,
    setPageSize,

    state,
    preGlobalFilteredRows,
    setGlobalFilter,
  } = useTable(
    {
      columns,
      data,
    },
    useFilters,
    useGlobalFilter,
    useSortBy,
    usePagination
  );

  const [value, setValue] = React.useState();
  const [truckType, setType] = React.useState();
  const [truckTypes, setTypes] = React.useState();

  React.useEffect(() => {
    (async () => {
      const response = await getTruckTypes();
      setTypes(response.data);
    })();
  }, []);

  const onChange = useAsyncDebounce((value) => {
    setGlobalFilter(value || undefined);
  }, 200);
  const onTypeChange = useAsyncDebounce((value) => {
    console.log(value);
    setGlobalFilter(value ? (value !== "null" ? value : undefined) : undefined);
  }, 200);

  return (
    <>
      {/* FILTER */}
      <div className="d-flex flex-row justify-content-between mb-3">
        {truckTypes ? (
          <Form.Control
            className="w-25"
            as="select"
            name="truckType"
            value={truckType}
            onChange={(e) => {
              setType(e.target.value);
              onTypeChange(e.target.value);
            }}
          >
            <option value="null">Select Type</option>
            {truckTypes.map((link) => (
              <option key={`option-${link.id}`} value={link.name}>
                {link.name}
              </option>
            ))}
          </Form.Control>
        ) : (
          <LoadingIndicator />
        )}

        <InputGroup className="w-25">
          <FormControl
            type="text"
            value={value || ""}
            onChange={(e) => {
              setValue(e.target.value);
              onChange(e.target.value);
            }}
            placeholder="Search"
          />
          <InputGroup.Append>
            <InputGroup.Text>
              <FaSearch />
            </InputGroup.Text>
          </InputGroup.Append>
        </InputGroup>
      </div>

      {/* TABLE */}
      <Table striped bordered hover {...getTableProps()}>
        <thead>
          {headerGroups.map((headerGroup) => (
            <tr {...headerGroup.getHeaderGroupProps()}>
              {headerGroup.headers.map((column) => (
                <th
                  scope="col"
                  {...column.getHeaderProps(column.getSortByToggleProps())}
                >
                  <div className="d-flex justify-content-between">
                    {column.render("Header")}
                    {/* Add a sort direction indicator */}
                    {column.disableSortBy ? (
                      ""
                    ) : (
                      <span>
                        {column.isSorted ? (
                          column.isSortedDesc ? (
                            <FaSortDown />
                          ) : (
                            <FaSortUp />
                          )
                        ) : (
                          <FaSort />
                        )}
                      </span>
                    )}
                  </div>
                </th>
              ))}
            </tr>
          ))}
        </thead>

        <tbody {...getTableBodyProps()} className="bg-white">
          {page.map((row, i) => {
            prepareRow(row);
            return (
              <tr {...row.getRowProps(rowProps(row))}>
                {row.cells.map((cell) => {
                  // console.log(cell);
                  return (
                    <td
                      {...cell.getCellProps()}
                      className="px-6 py-4 whitespace-nowrap"
                      role="cell"
                    >
                      {cell.column.Cell.name === "defaultRenderer" ? (
                        <div>{cell.render("Cell")}</div>
                      ) : (
                        cell.render("Cell")
                      )}
                    </td>
                  );
                })}
              </tr>
            );
          })}
        </tbody>
      </Table>

      {/* Pagination */}
      <div className="py-3 d-flex items-center justify-content-between">
        <div className="flex-1 flex justify-content-between">
          <Button
            variant="outline-light"
            className="btn-w-120 text-dark"
            onClick={() => previousPage()}
            disabled={!canPreviousPage}
          >
            <FaChevronLeft /> Previous
          </Button>
          <Button
            variant="outline-light"
            className="btn-w-120 text-dark"
            onClick={() => nextPage()}
            disabled={!canNextPage}
          >
            Next
            <FaChevronRight />
          </Button>
        </div>

        <div className="flex-1">
          <div className="">
            <span className="mr-2">
              Page <span className="font-medium">{state.pageIndex + 1}</span> of{" "}
              <span className="font-medium">{pageOptions.length}</span>
            </span>
            <label>
              <Form.Group>
                <Form.Control
                  as="select"
                  className="mb-0"
                  value={state.pageSize}
                  onChange={(e) => {
                    setPageSize(Number(e.target.value));
                  }}
                >
                  {[5, 10, 20].map((pageSize) => (
                    <option key={pageSize} value={pageSize}>
                      Show {pageSize}
                    </option>
                  ))}
                </Form.Control>
              </Form.Group>
            </label>
          </div>
        </div>
      </div>
    </>
  );
}
