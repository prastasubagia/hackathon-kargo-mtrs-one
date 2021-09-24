import * as React from "react";
import { FormControl, InputGroup } from "react-bootstrap";
import { useAsyncDebounce } from "react-table";
import { FaSearch } from "react-icons/fa";

export function TableFilter({
  preGlobalFilteredRows,
  globalFilter,
  setGlobalFilter,
}) {
  // const count = preGlobalFilteredRows.length;
  const [value, setValue] = React.useState(globalFilter);
  const onChange = useAsyncDebounce((value) => {
    setGlobalFilter(value || undefined);
  }, 200);

  return (
    <label className="">
      <InputGroup>
        {/* <span className="">Search: </span> */}
        <FormControl
          type="text"
          value={value || ""}
          onChange={(e) => {
            setValue(e.target.value);
            onChange(e.target.value);
          }}
          placeholder="Search"
          // placeholder={`${count} records...`}
        />
        <InputGroup.Append>
          <InputGroup.Text>
            <FaSearch />
          </InputGroup.Text>
        </InputGroup.Append>
      </InputGroup>
    </label>
  );
}
